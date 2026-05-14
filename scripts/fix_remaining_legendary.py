#!/usr/bin/env python3
"""Fix remaining legendary enchant entries that weren't caught by first script.
These have multi-line descriptions or escaped quotes in names.
"""
import json
import re

# Load zone mapping
with open('/home/synth/projects/open_ascension/scripts/zone_mapping.json') as f:
    zone_map = json.load(f)

# Read the file
with open('/home/synth/projects/open_ascension/lib/data/models/mystic_enchant.dart') as f:
    content = f.read()

# Pattern to find legendary entries WITHOUT zone: field
# Match from "MysticEnchant(" to "tier: EnchantTier.legendary),"
# but the block must NOT contain "zone:"
pattern = r"(MysticEnchant\([^)]*?name:\s*'((?:[^'\\]|\\')*)'[^)]*?tier:\s*EnchantTier\.legendary\))"

# Find all matches
matches = list(re.finditer(pattern, content, re.DOTALL))
print(f"Found {len(matches)} total legendary entries")

# Now find which ones DON'T have zone: on the same line as tier
no_zone_entries = []
for m in matches:
    block = m.group(0)
    name_raw = m.group(2)
    # Unescape the name: \' -> '
    name_clean = name_raw.replace("\\'", "'")
    
    if 'zone:' not in block:
        # Check if there's a zone: on a nearby line (within the full entry)
        start = m.start()
        # Look ahead 500 chars for zone:
        snippet = content[start:start+500]
        if 'zone:' not in snippet.split('tier:')[0]:
            no_zone_entries.append({
                'name_raw': name_raw,
                'name_clean': name_clean,
                'start': m.start(),
                'block': block,
            })

print(f"Entries without zone: {len(no_zone_entries)}")

# Now process and fix them
fixes = []
for entry in no_zone_entries:
    name_clean = entry['name_clean']
    name_raw = entry['name_raw']
    block = entry['block']
    
    # Try exact match first
    if name_clean in zone_map:
        zone_info = zone_map[name_clean]
        fixes.append({
            'name': name_clean,
            'name_raw': name_raw,
            'zone': zone_info['zone'],
            'location': zone_info['location'],
            'old_block': block,
        })
    else:
        # Try fuzzy match - remove extra spaces, etc
        for zone_name in zone_map:
            if zone_name.strip().lower() == name_clean.strip().lower():
                zone_info = zone_map[zone_name]
                fixes.append({
                    'name': name_clean,
                    'name_raw': name_raw,
                    'zone': zone_info['zone'],
                    'location': zone_info['location'],
                    'old_block': block,
                })
                break
        else:
            print(f"  NO MATCH for: {name_clean} (raw: {name_raw})")

print(f"\nFixes to apply: {len(fixes)}")
for fix in fixes:
    print(f"  {fix['name']} -> {fix['zone']}")
    zone_escaped = fix['zone'].replace("'", "\\'")
    loc_escaped = fix['location'].replace("'", "\\'")
    
    # Replace "tier: EnchantTier.legendary)" with "tier: EnchantTier.legendary,\n          zone: '{zone}', locationDetails: '{location}')"
    old_end = "tier: EnchantTier.legendary)"
    new_end = f"tier: EnchantTier.legendary,\n          zone: '{zone_escaped}',\n          locationDetails: '{loc_escaped}')"
    
    new_block = fix['old_block'].replace(old_end, new_end)
    
    if new_block == fix['old_block']:
        print(f"    WARNING: No replacement made for {fix['name']}")
        # Try with different ending format
        old_end2 = "tier: EnchantTier.legendary),"
        new_end2 = f"tier: EnchantTier.legendary,\n          zone: '{zone_escaped}',\n          locationDetails: '{loc_escaped}'),"
        new_block = fix['old_block'].replace(old_end2, new_end2)
        if new_block == fix['old_block']:
            print(f"    ERROR: Still no match for {fix['name']}")
            # Debug: show the last 30 chars of the block
            print(f"    Block ends with: '{fix['old_block'][-40:]}'")
        else:
            print(f"    Fixed with alternative format")
    else:
        print(f"    Fixed")
    
    fix['new_block'] = new_block

# Apply all replacements
for fix in fixes:
    if 'new_block' in fix and fix['new_block'] != fix['old_block']:
        content = content.replace(fix['old_block'], fix['new_block'], 1)

# Write back
with open('/home/synth/projects/open_ascension/lib/data/models/mystic_enchant.dart', 'w') as f:
    f.write(content)

print(f"\nFile updated. {len(fixes)} entries fixed.")

# Verify: count how many legendary entries now have zone:
legendary_with_zone = len(re.findall(r"tier:\s*EnchantTier\.legendary,[^)]*zone:", content))
legendary_total = len(re.findall(r"tier:\s*EnchantTier\.legendary", content))
print(f"Legendary entries with zone: {legendary_with_zone}/{legendary_total}")
