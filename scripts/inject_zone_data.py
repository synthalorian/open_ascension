#!/usr/bin/env python3
"""Inject zone and location data into mystic_enchant.dart legendary entries."""

import json
import re

# Load zone mapping
with open('/home/synth/projects/open_ascension/scripts/zone_mapping.json', 'r') as f:
    zone_map = json.load(f)

# Read the current file
with open('/home/synth/projects/open_ascension/lib/data/models/mystic_enchant.dart', 'r') as f:
    content = f.read()

print(f"Read {len(content)} bytes from mystic_enchant.dart")

# Pattern to match legendary enchant definitions
# Handles both single-line and multi-line entries
legendary_pattern = r"(\s*)(MysticEnchant\(id: '([^']+)', name: '([^']+)',\s+description: '([^']+)',\s*tier: EnchantTier\.legendary\))"

def replace_match(match):
    indentation = match.group(1)
    full_match = match.group(2)
    enchant_id = match.group(3)
    enchant_name = match.group(4)
    description = match.group(5)
    
    # Look up zone mapping for this enchant name
    if enchant_name in zone_map:
        zone_data = zone_map[enchant_name]
        zone = zone_data['zone']
        location = zone_data['location']
        
        # Escape single quotes in zone/location for Dart
        zone_escaped = zone.replace("'", "\\'")
        location_escaped = location.replace("'", "\\'")
        
        # Return updated entry with zone and location
        return f'''{indentation}MysticEnchant(id: '{enchant_id}', name: '{enchant_name}',
          description: '{description}', tier: EnchantTier.legendary,
          zone: '{zone_escaped}', locationDetails: '{location_escaped}'),'''
    
    # If no mapping, return original
    return full_match

# Replace all legendary entries
updated_content, count = re.subn(legendary_pattern, replace_match, content)

print(f"Updated {count} legendary enchant entries")

# Check which enchants were NOT found in zone map
original_names = re.findall(r"name: '([^']+)',\s+description: '[^']+',\s*tier: EnchantTier\.legendary", content)
mapped_names = set()
for match in re.finditer(legendary_pattern, content):
    mapped_names.add(match.group(4))

unmapped = [name for name in original_names if name not in mapped_names]
if unmapped:
    print(f"\n{len(unmapped)} legendary enchants not mapped:")
    for name in unmapped:
        print(f"  - {name}")

# Also handle multi-line legendary entries that weren't caught
# Pattern for multi-line descriptions
multiline_pattern = r"(\s*)(MysticEnchant\(id: '([^']+)', name: '([^']+)'.*?tier: EnchantTier\.legendary\))"

# Don't re-process already updated ones
already_processed = set(re.findall(r"name: '([^']+)',.*?tier: EnchantTier\.legendary,.*?zone:", updated_content, re.DOTALL))

# For now, just save what we have
# Check for entries that still don't have zone data
updated_entries = re.findall(r"name: '([^']+)', description: '[^']*', tier: EnchantTier\.legendary", updated_content)
not_updated = [name for name in updated_entries if name not in mapped_names and name in zone_map]

if not_updated:
    print(f"\n{len(not_updated)} entries still need manual update (multi-line or non-standard format)")
    for name in not_updated:
        print(f"  - {name}")

# Write the updated file
with open('/home/synth/projects/open_ascension/lib/data/models/mystic_enchant.dart', 'w') as f:
    f.write(updated_content)

print(f"\nUpdated file written ({len(updated_content)} bytes)")
print(f"\nSummary:")
print(f"  - Total legendary enchants: {len(original_names)}")
print(f"  - Mapped and updated: {count}")
print(f"  - Still need manual update: {len(original_names) - count}")
