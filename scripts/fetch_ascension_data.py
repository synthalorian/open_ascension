#!/usr/bin/env python3
"""
Fetch all Ascension.help reference tables from Supabase and dump to assets/data/.

This script uses urllib (stdlib) to avoid requests SSL quirks.
Sets a browser-like User-Agent to avoid bot blocks.

Usage:
  export ASCENSION_ANON_KEY="eyJ..."
  python3 scripts/fetch_ascension_data.py

Outputs JSON files to assets/data/.
"""

import os
import sys
import json
import urllib.request
import urllib.parse
from pathlib import Path

# ---------------------------------------------------------------------------
BASE_URL = "https://nzoibbcwvyrlhacuvocb.supabase.co/rest/v1"
TABLES = [
    "mystic_enchants", "mythic_affixes", "dungeon_routes", "dungeon_route_images",
    "servers", "feature_flags", "page_content", "feature_suggestions",
    # Include empty tables for forward-compatibility
    "weakauras", "weakaura_suggestions", "enchant_suggestions", "enchant_tags",
    "item_affix_suggestions", "weekly_affixes", "tags"
]
ASSETS_DIR = Path(__file__).parent.parent / "assets" / "data"
ASSETS_DIR.mkdir(parents=True, exist_ok=True)

# ---------------------------------------------------------------------------
# Get API key
# ---------------------------------------------------------------------------
API_KEY = os.environ.get("ASCENSION_ANON_KEY") or os.environ.get("ASCENSION_API_KEY")
if not API_KEY:
    key_path = Path.home() / ".config" / "ascension_key"
    if key_path.is_file():
        API_KEY = key_path.read_text().strip()
    else:
        print("ERROR: No API key found. Set ASCENSION_ANON_KEY or write key to ~/.config/ascension_key", file=sys.stderr)
        sys.exit(1)

HEADERS = {
    "apikey": API_KEY,
    "Authorization": f"Bearer {API_KEY}",
    "Prefer": "count=exact",
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
}

# ---------------------------------------------------------------------------
def build_url(table, limit=1000, offset=0):
    q = urllib.parse.urlencode({"limit": limit, "offset": offset})
    return f"{BASE_URL}/{table}?{q}"

def fetch_all_rows(table: str):
    """Fetch all rows from a table via pagination."""
    results = []
    offset = 0
    page_size = 1000
    total = None
    while True:
        url = build_url(table, limit=page_size, offset=offset)
        req = urllib.request.Request(url, headers=HEADERS)
        with urllib.request.urlopen(req, timeout=20) as resp:
            status = resp.getcode()
            if status != 200:
                raise RuntimeError(f"HTTP {status} for {table}@{offset}")
            content = resp.read().decode("utf-8")
            batch = json.loads(content)
            cr = resp.headers.get("Content-Range", "")
            if total is None:
                if "/" in cr:
                    total = int(cr.split("/")[-1])
                else:
                    total = len(batch)  # fallback
            results.extend(batch)
            fetched = len(batch)
            if offset + fetched >= total:
                break
            offset += fetched
            print(f"  Progress: {offset}/{total} rows for {table}...")
    return results

# ---------------------------------------------------------------------------
def main():
    print(f"Fetching {len(TABLES)} tables to {ASSETS_DIR}")
    meta = {"tables": {}, "fetched_at": "??"}  # We'll not rely on external timeapi to avoid network dependency
    for table in TABLES:
        try:
            print(f"→ {table}")
            data = fetch_all_rows(table)
            out_path = ASSETS_DIR / f"{table}.json"
            out_path.write_text(json.dumps(data, indent=2))
            meta["tables"][table] = {"count": len(data), "path": out_path.name}
            print(f"   saved {len(data)} rows")
        except Exception as e:
            print(f"   ERROR: {e}", file=sys.stderr)
            meta["tables"][table] = {"error": str(e)}
    meta_path = ASSETS_DIR / "meta.json"
    import datetime
    meta["fetched_at"] = datetime.datetime.utcnow().isoformat() + "Z"
    meta_path.write_text(json.dumps(meta, indent=2))
    print(f"\n✔ Done. Meta: {meta_path}")

if __name__ == "__main__":
    main()
