# Open Ascension — Next Steps

This file tracks what's done and what needs to happen next. Any session should read this first, pick up where we left off, and update completed items.

---

## Completed ✅

- [x] Flutter project scaffold (Flutter 3.41.9, Riverpod, go_router)
- [x] Data models with JSON serialization: WarClass (9), Race (11), Ability (170+), Talent (195), MysticEnchant (19), Build, Realm (6), LoreEntry (6)
- [x] App navigation (8 routes: home, class, talents/:classId/:spec, enchants, builds, lore, lore/:entryId, settings)
- [x] Theme system (11 themes: 3 core + 4 synthwave + 4 lore) with SharedPreferences persistence
- [x] HomeScreen with quick-access cards
- [x] ClassBuilderScreen with Abilities/Talents/Enchants/Stats tabs
- [x] TalentTreeScreen with spec tabs, point tracking, tier grouping
- [x] MysticEnchantScreen with slot tabs, tier colors, detail bottom sheets
- [x] BuildManagerScreen with save/edit/delete
- [x] LoreScreen with category tabs and search
- [x] LoreEntryScreen with related entries navigation
- [x] SettingsScreen with theme grid selector, data export/import/clear
- [x] AppDatabase with SharedPreferences persistence for builds
- [x] **ALL 30 analyzer issues fixed** — zero warnings, zero errors
- [x] Clean build (Linux desktop binary at build/linux/x64/debug/bundle/open_ascension)
- [x] **All 195 talents across all 9 classes × 3 specs** (Warrior 27, Paladin 24, Hunter 25, Rogue 22, Priest 21, Death Knight 20, Shaman 19, Mage 17, Warlock 20)
- [x] Git initialized, initial commit made (115 files)
- [x] README.md written
- [x] Research data collected from ascension.gg wiki

---

## Priority 1: Data Completeness

The app works and ALL classes now have talent data — but there's still room to expand.

### Talents — Deepen Existing Trees

All 27 specs have core talents. Next: fill out full 7-tier trees to match WoW density.

**Current state:** 195 talents across 9 classes. Target: ~300-350 for full WotLK trees (~7 tiers × ~4-5 talents × 27 specs).

### Abilities — Expand Per Class

Current: ~170 abilities but unevenly distributed.
- Each class should have 15-30 core abilities
- Include: racials, passives, stances/forms

### Mystic Enchants — Expand

Current: 19 enchants. Need 40-60 total.
- More Weapon/Main Hand/Off Hand enchants per tier
- More stat boosts, proc effects, class-specific enchants

### Lore Entries — Expand Dramatically

Current: 6 entries. Need 30-50+.
- Timeline (10+): Creation, Titans, War of Ancients, Sundering, Dark Portal, First/Second/Third War, TBC, WotLK
- Characters (15+): Arthas, Illidan, Thrall, Jaina, etc.
- Factions (5+): Alliance, Horde, Burning Legion, etc.
- Locations (10+): All continents, major zones
- Ascension-specific (5+): Server history, custom content
- Items (5+): Frostmourne, Thunderfury, etc.

---

## Priority 2: Feature Gaps

### Class Builder — Stats Tab

The Stats tab is a placeholder ("Stats tab coming soon..."). Needs:
- Primary stats: Str, Agi, Sta, Int, Spirit
- Secondary stats: Crit, Hit, Haste, Armor, etc.
- Stat-to-value formulas

### Mystic Enchant Screen — Selection State

Currently shows detail sheets but no persistent selection. Should:
- Track selected enchants per slot
- Show selected enchant summary
- Allow saving to a build

### Talent Tree Screen — Visual Layout

Current: Simple list grouped by tier. Could improve:
- Visual tree layout with connecting lines
- Prerequisite enforcement
- Mutually exclusive node handling

### Build Manager — View/Edit Build

Click saved build → loads into Class Builder for editing with pre-populated data.

### Settings Screen — Data Import

Import button shows "Import coming soon". Needs:
- Pick JSON file, parse, merge builds
- Show import result (N imported, M conflicts)

---

## Priority 3: Additional Features

### Realm Browser

Realm model exists (6 servers). Need UI:
- realm_browser_screen.dart
- List realms with status, population, PvP flag, ruleset, max level

### Gear Database

Item database for WotLK:
- Model: GearItem with id, name, itemLevel, type, stats, set bonus, rarity
- 200+ key items (Naxx, OS, Ulduar, ICC)
- Browser with filters

### Character Import/Export via Short Codes

- Base64 encode build JSON → shareable codes
- Paste code to import

---

## Priority 4: Polish

### Icons & Assets

- Class icons, race portraits, talent icons
- Asset paths under assets/images/

### Performance

- Lazy-load large datasets
- Profile with DevTools

### Testing

- Unit tests for model serialization round-trips
- Widget tests for each screen

---

## Priority 5: Distribution

### Web Build

- `flutter build web --release`
- Host on GitHub Pages

### Android/iOS

- Requires Android SDK / macOS

---

## Technical Debt

### Dart 3.11.5 Enum Bug

`AppThemeMode`, `EnchantSlot`, `EnchantTier` use class/static-const pattern due to Dart 3.11.5 compiler regression. Migrate when Dart is updated past this.

### Session Handoff

1. Read this file first
2. `cd /home/synth/projects/open_ascension`
3. `export PATH="/home/synth/projects/flutter/bin:$PATH"`
4. `flutter pub get`
5. `flutter analyze` — verify zero errors
6. `flutter run` — verify app launches
7. Pick a priority item and get to work
8. Update this file and commit when done

**Local path:** /home/synth/projects/open_ascension
**Binary:** /home/synth/projects/open_ascension/build/linux/x64/debug/bundle/open_ascension
