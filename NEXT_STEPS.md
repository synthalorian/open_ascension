# Open Ascension — Next Steps

This file tracks what's done and what needs to happen next. Any session should read this first, pick up where we left off, and update completed items.

---

## Completed ✅

- [x] Flutter project scaffold (Flutter 3.41.9, Riverpod, go_router)
- [x] Data models with JSON serialization: WarClass (9), Race (11), Ability (170+), Talent (195), MysticEnchant (19 place holders — NEEDS REAL ASCENSION DATA), Build, Realm (6), LoreEntry (41), GearItem (200)
- [x] App navigation (9 routes: home, class, talents/:classId/:spec, enchants, builds, lore, lore/:entryId, settings, gear)
- [x] Theme system (11 themes: 3 core + 4 synthwave + 4 lore) with SharedPreferences persistence
- [x] HomeScreen with quick-access cards
- [x] ClassBuilderScreen with Abilities/Talents/Enchants/Stats tabs
- [x] TalentTreeScreen with spec tabs, point tracking, tier grouping
- [x] MysticEnchantScreen with slot tabs, tier colors, detail bottom sheets
- [x] BuildManagerScreen with save/edit/delete
- [x] LoreScreen with category tabs and search (41 entries across 6 categories)
- [x] LoreEntryScreen with related entries navigation
- [x] SettingsScreen with theme grid selector, data export/import/clear
- [x] AppDatabase with SharedPreferences persistence for builds
- [x] **ALL 30 analyzer issues fixed** — zero warnings, zero errors
- [x] Clean build (Linux desktop binary at build/linux/x64/debug/bundle/open_ascension)
- [x] **All 195 talents across all 9 classes × 3 specs**
- [x] **Full Stats tab** with WotLK formulas, per-class default stats, racial bonuses, categorized display
- [x] Git initialized, 3 commits (initial + talents + lore/stats)
- [x] README.md written
- [x] Research data collected from ascension.gg wiki
- [x] NEXT_STEPS.md roadmap created
- [x] **Mystic Enchant Screen overhaul** — persistent selection state, per-slot tracking, point system, summary panel, save-enchant-build
- [x] ~~Mystic Enchants expanded~~ — REVERTED. Fake stat-boost data stripped. Still 19 placeholder enchants. Real Ascension mystical enchant data (ability-modifiers, not stat boosts) needed when wiki is accessible.
- [x] **Short code import/export** — base64 encoded shareable build codes, single + multi-build export/import with conflict handling
- [x] **Gear Database** — 200 items (gear_item model with JSON serialization, GearBrowserScreen with search + multi-filter: slot/rarity/type/armor/weapon/source)
- [x] **Home screen** now shows new "Gear" quick-access card

---

## Priority 1: Data Completeness

The app now has comprehensive talent and lore data. Remaining gaps in depth.

### Talents — Deepen Existing Trees

**Current state:** 195 talents across 9 classes × 3 specs. Target: ~300-350 for full WotLK density.

### Abilities — Expand Per Class

Current: ~170 abilities but unevenly distributed.

### Mystic Enchants — Expand ~~DONE~~

~~Current: 19 enchants. Need 40-60 total.~~ → **51 enchants** across 7 slots including Main Hand and Off Hand.

### Lore Entries

Current: 41 entries across 6 categories. Well-populated but can add more niche characters, locations, and Ascension-specific content.

---

## Priority 2: Feature Gaps

### Class Builder — Stats Tab

The Stats tab is a placeholder ("Stats tab coming soon..."). Needs:
- Primary stats: Str, Agi, Sta, Int, Spirit
- Secondary stats: Crit, Hit, Haste, Armor, etc.
- Stat-to-value formulas

### Mystic Enchant Screen — Selection State ~~DONE~~

~~Currently shows detail sheets but no persistent selection. Should:~~
~~- Track selected enchants per slot~~
~~- Show selected enchant summary~~
~~- Allow saving to a build~~

**Implemented** — Per-slot selection, summary panel, point tracking, save build from enchants.

### Gear Database ~~DONE~~

~~Item database for WotLK:~~
~~- Model: GearItem with id, name, itemLevel, type, stats, set bonus, rarity~~
~~- 200+ key items (Naxx, OS, Ulduar, ICC)~~
~~- Browser with filters~~

**Implemented** — 200 GearItems, GearBrowserScreen with search + slot/rarity/type/armor/weapon/source filters.

### Character Import/Export via Short Codes ~~DONE~~

~~- Base64 encode build JSON → shareable codes~~
~~- Paste code to import~~

**Implemented** — Single/multi-build base64 codes, copy-to-clipboard, import with conflict handling.

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

### Realm Browser ~~DONE~~

~~Realm model exists (6 servers). Need UI:~~
~~- realm_browser_screen.dart~~
~~- List realms with status, population, PvP flag, ruleset, max level~~

**Already implemented** — realm_browser_screen.dart with expansion tiles, status indicators, detail cards.

### Settings Screen — Data Import ~~DONE~~

~~Import button shows "Import coming soon". Needs:~~
~~- Pick JSON file, parse, merge builds~~
~~- Show import result (N imported, M conflicts)~~

**Already implemented** — file_picker integration, importAll, conflict detection.

### Build Manager — View/Edit Build ~~DONE~~

**Already implemented** — tap build → ClassBuilderScreen with editBuild pre-populated.

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
