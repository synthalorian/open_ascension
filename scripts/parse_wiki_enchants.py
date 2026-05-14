import re
import json

# Read the wiki content from the file
with open('/home/synth/projects/open_ascension/raw_wiki_content.txt', 'r') as f:
    content = f.read()

print(f"Read {len(content)} characters from wiki content")

# Extract the Legendary Enchants section
# The section starts with === Legendary Enchants === and ends with === or [[de:
section_start = content.find('=== <font color="#ff8000">Legendary</font> Enchants ===')
if section_start == -1:
    # Try without font tags
    section_start = content.find('=== Legendary Enchants ===')
    
if section_start == -1:
    print("Could not find Legendary section")
    # Try to find any "Legendary" section
    for line in content.split('\n'):
        if 'Legendary' in line and '===' in line:
            print(f"Found line: {line[:100]}")
    exit(1)

section_end = content.find('[[de:', section_start)
if section_end == -1:
    section_end = content.find('\n|}', section_start + 1000)
    if section_end != -1:
        section_end += 3  # Include the |}

legendary_section = content[section_start:section_end]
print(f"\nLegendary section length: {len(legendary_section)} chars")

# Parse table entries: |- followed by |name\n|description
entries = []
current_name = None
current_desc = None

for line in legendary_section.split('\n'):
    line = line.strip()
    
    if line == '|-':
        # Save previous entry if exists
        if current_name and current_desc:
            entries.append({
                'name': current_name,
                'description': current_desc
            })
        current_name = None
        current_desc = None
    
    elif line.startswith('|') and not line.startswith('!'):
        # Clean wiki markup
        clean_line = re.sub(r'\[\[([^\]|]*)\|?([^\]]*)\]\]', lambda m: m.group(2) or m.group(1), line)
        clean_line = clean_line.lstrip('|').rstrip('|').strip()
        clean_line = re.sub(r'<[^>]+>', '', clean_line)
        clean_line = clean_line.replace("'''", '').replace("''", '').strip()
        clean_line = re.sub(r'\[https?://[^\s\]]*\s*([^\]]*)\]', r'\1', clean_line)
        
        if current_name is None:
            current_name = clean_line
        elif current_desc is None:
            current_desc = clean_line
        else:
            # Multi-line description
            current_desc += ' ' + clean_line

# Don't forget the last entry
if current_name and current_desc:
    entries.append({
        'name': current_name,
        'description': current_desc
    })

# Also parse other tiers
def parse_tier_section(content, tier_name, tier_label):
    start_marker = f'<font color=#{tier_label}>'
    start = content.find(start_marker)
    if start == -1:
        start = content.find(f'=== {tier_name} Enchants ===')
    if start == -1:
        return []
    
    # Find the end of this section
    end = content.find('===', start + 100)
    if end == -1:
        end = content.find('\n|', start + 100)
        if end != -1:
            end = content.find('\n|}', end) + 3
    
    section = content[start:end]
    tier_entries = []
    current_name = None
    current_desc = None
    
    for line in section.split('\n'):
        line = line.strip()
        if line == '|-':
            if current_name and current_desc:
                tier_entries.append({
                    'name': current_name,
                    'description': current_desc,
                    'tier': tier_name.lower()
                })
            current_name = None
            current_desc = None
        elif line.startswith('|') and not line.startswith('!'):
            clean_line = re.sub(r'\[\[([^\]|]*)\|?([^\]]*)\]\]', lambda m: m.group(2) or m.group(1), line)
            clean_line = clean_line.lstrip('|').rstrip('|').strip()
            clean_line = re.sub(r'<[^>]+>', '', clean_line)
            clean_line = clean_line.replace("'''", '').replace("''", '').strip()
            clean_line = re.sub(r'\[https?://[^\s\]]*\s*([^\]]*)\]', r'\1', clean_line)
            
            if current_name is None:
                current_name = clean_line
            elif current_desc is None:
                current_desc = clean_line
            else:
                current_desc += ' ' + clean_line
    
    if current_name and current_desc:
        tier_entries.append({
            'name': current_name,
            'description': current_desc,
            'tier': tier_name.lower()
        })
    
    return tier_entries

# Parse all tiers
all_enchants = []

# Uncommon
uncommon_ents = parse_tier_section(content, 'Uncommon', '1eff00')
print(f"\nUncommon enchants: {len(uncommon_ents)}")
for e in uncommon_ents:
    all_enchants.append(e)

# Rare  
rare_ents = parse_tier_section(content, 'Rare', '0080ff')
print(f"Rare enchants: {len(rare_ents)}")
for e in rare_ents:
    all_enchants.append(e)

# Epic
epic_ents = parse_tier_section(content, 'Epic', 'b048f8')
print(f"Epic enchants: {len(epic_ents)}")
for e in epic_ents:
    all_enchants.append(e)

# Legendary
print(f"\nLegendary enchants: {len(entries)}")
for e in entries:
    e['tier'] = 'legendary'
    all_enchants.append(e)

print(f"\nTotal enchants from wiki: {len(all_enchants)}")

# Save to JSON
with open('/home/synth/projects/open_asccentration/lib/data/models/wiki_enchants.json', 'w') as f:
    json.dump(all_enchants, f, indent=2, ensure_ascii=False)

print("\nFirst 5 uncommon:")
for e in uncommon_ents[:5]:
    print(f"  [{e['tier']}] {e['name']}: {e['description'][:80]}...")

print("\nFirst 5 rare:")
for e in rare_ents[:5]:
    print(f"  [{e['tier']}] {e['name']}: {e['description'][:80]}...")

print("\nFirst 5 epic:")
for e in epic_ents[:5]:
    print(f"  [{e['tier']}] {e['name']}: {e['description'][:80]}...")

print("\nFirst 5 legendary:")
for e in entries[:5]:
    print(f"  [{e['tier']}] {e['name']}: {e['description'][:80]}...")
