# Open Ascension — Next Steps (Expanded Scope)

**Mission:** Integrate all reference data from [ascension.help](https://ascension.help/) (Worldforged Reference Database) to create the definitive companion app for World of Warcraft: Ascension.

---

## Completed ✅

- [x] Flutter project scaffold (Flutter 3.41.9, Riverpod, go_router)
- [x] Data models with JSON serialization: WarClass (9), Race (11), Ability (170+), Talent (195), MysticEnchant (231), Build, Realm (6), LoreEntry (41), GearItem (200)
- [x] App navigation (9 routes: home, class, talents/:classId/:spec, enchants, builds, lore, lore/:entryId, settings, gear)
- [x] Theme system (11 themes: 3 core + 4 synthwave + 4 lore) with SharedPreferences persistence
- [x] HomeScreen with quick-access cards
- [x] ClassBuilderScreen with Abilities/Talents/Enchants/Stats tabs
- [x] TalentTreeScreen with spec tabs, point tracking, tier grouping
- [x] MysticEnchantScreen with slot tabs, tier colors, detail bottom sheets
- [x] MysticEnchant overhaul — persistent selection, per-slot tracking, point system, summary panel, save-enchant-build
- [x] Mystic Enchants zone data — Added zone & locationDetails; all 119 legendary enchants mapped. 51 unique zones.
- [x] BuildManagerScreen with save/edit/delete + tap-to-edit
- [x] LoreScreen with category tabs and search (41 entries across 6 categories)
- [x] LoreEntryScreen with related entries navigation
- [x] SettingsScreen with theme selector, data export/import/clear, clipboard codes
- [x] AppDatabase with SharedPreferences persistence for builds
- [x] **All 195 talents across 9 classes × 3 specs** (≈300 nodes including ranks)
- [x] **Stats tab** with WotLK formulas, per-class defaults, racial bonuses, categorized display
- [x] **Gear Database** — 200 items, GearBrowserScreen with slot/rarity/type/armor/weapon/source filters
- [x] **Character import/export** via base64 shareable codes, multi-build support
- [x] **Realm Browser** (formerly Servers) — list + details for 3 servers
- [x] **Zero analyzer issues** — clean build, Linux release binary
- [x] Git initialized, README written, GitHub Actions web deploy
- [x] **Hermes CLI wrapper** updated — defaults to Nous step-3.5-flash provider, resolves model shorthand, emits proper `openai/<model>` flag.
- [x] **Ascension.help data discovery**
  - Extracted Supabase anon key from client JS bundle (read-only, safe for dev)
  - Enumerated live Supabase endpoints and schemas
  - Confirmed content-rich tables: `mystic_enchants` (176), `mythic_affixes` (9), `dungeon_routes` (13), `dungeon_route_images` (13), `servers` (3), `feature_flags` (8), `page_content` (1), `feature_suggestions` (1)
  - Identified empty tables: `weakauras`, `weakaura_suggestions`, `enchant_suggestions`, `enchant_tags`, `item_affix_suggestions`, `weekly_affixes`, `tags`
  - Mapped navigation routes to tables
  - Verified Items → `/items/affixes` page uses `item_affix_suggestions` (currently empty)

---

## Phase 1: Ascension.help Data Pipeline

### 1.1 Harvest Script
- Write `scripts/fetch_ascension_data.py`:
  - Use anon key to query each table via `count=exact`, paginate through all rows
  - Save one JSON file per table under `assets/data/` (including empty ones)
  - Include `meta.json` with fetch timestamp, source version, total counts
- Commit JSON assets (expected < 1MB total)

### 1.2 Dart Models
- Generate `lib/data/models/ascension/`:
  - `affix.dart` → `mythic_affixes` fields (`id, name, summary, description, ascension_notes, tips, icon_url, sort_order`)
  - `dungeon_route.dart` → `dungeon_routes` (`id, name, notes, expansion, difficulty_notes, affix_notes, group_tips, season_label, extra_data`)
  - `dungeon_route_image.dart` → `dungeon_route_images` (`id, dungeon_id, image_url, caption, sort_order`)
  - `server.dart` → `servers` (`id, name`) — could replace/extend `Realm`
  - `feature_flag.dart`, `page_content.dart`, `feature_suggestion.dart`
  - Stub models: `weakaura.dart`, `weekly_affix.dart`, `enchant_suggestion.dart`, `item_affix_suggestion.dart`, `tag.dart` (empty now)
- Use `json_serializable`, make immutable, include `copyWith`, equality, toString.
- Run `build_runner` to regenerate `.g.dart`.

### 1.3 Repository & Providers
- `lib/data/repository/ascension_repository.dart`:
  - Loads each JSON from assets on demand, returns `List<T>`
  - Wrap in Riverpod `FutureProvider` for each collection:
    - `affixesProvider`, `dungeonRoutesProvider`, `dungeonRouteImagesProvider`, `serversProvider`,
      `featureFlagsProvider`, `pageContentProvider`, `featureSuggestionsProvider`,
      `weakaurasProvider`, `weeklyAffixesProvider`, `itemAffixSuggestionsProvider`, `tagsProvider`.
- Cache results in memory; provide helper lookups (e.g., `getAffixesByCategory` if needed).

---

## Phase 2: UI — Reference Sections

### 2.1 Navigation Structure
- Update `AppRouter` to include new routes under `/affixes`, `/dungeon-routes`, `/weakauras`, `/suggestions`, `/maps`, `/items/affixes` (as Items section), `/classes` (optional).
- Rearrange drawer:
  - **Character Builder** → Class, Talents, Enchants, Builds, Gear
  - **Reference** → Mystic Enchants, Affixes, Dungeon Routes, M+ Upgrades, M+ Affixes, WeakAuras, Items (→ Affix suggestions), Maps, Classes
  - **Lore** → Lore, Lore Entry
  - **Settings** → Settings

### 2.2 Unified Reference List Scaffold
- Create reusable `ReferenceListScreen<T>` scaffold with search, sort, and card list.
- Each feature extends with specific tile/color scheme.

### 2.3 Affix Browser
- `features/affixes/affix_list_screen.dart`
- Grid of cards: icon, name, summary (truncated). Tap → detail.
- `features/affixes/affix_detail_screen.dart`: full description, ascension_notes, tips.
- Since table small, simple list.

### 2.4 Dungeon Route Browser
- `features/dungeon_routes/dungeon_route_list_screen.dart`: list of routes with icon, name, expansion badge.
- `features/dungeon_routes/dungeon_route_detail_screen.dart`:
  - Display name, notes, difficulty_notes, affix_notes, group_tips, season_label.
  - Horizontal image carousel from `dungeon_route_images` where `dungeon_id` matches.
  - Maybe a map placeholder later.

### 2.5 WeakAura Gallery
- `features/weakauras/weakaura_list_screen.dart`:
  - If `weakauras` empty → show an empty-state illustration + "No WeakAuras submitted yet" and a button to Suggestions.
  - Else: list of WA cards: name, author (maybe), description.
- `features/weakauras/weakaura_detail_screen.dart`: show WA string (copy button + syntax highlighting), install instructions.

### 2.6 Suggestions
- `features/suggestions/suggestion_list_screen.dart`: read-only list from `feature_suggestions`.
  - Show title, upvote/downvote counts, status.
  - Tapping shows details + description.
- Inline voting not possible without write auth; link to website for contributions.

### 2.7 Maps
- `features/maps/map_screen.dart`:
  - If `tags` (map markers) populated → display interactive map (leaflet/flutter_map) with markers.
  - Empty → placeholder art + text: "Interactive zone maps are coming soon! Check the website to contribute."

### 2.8 Items (→ Item Affix Suggestions)
- `features/items/item_affix_suggestions_screen.dart`:
  - Mirror of Suggestions but filtered to item affix suggestions (`item_affix_suggestions`).
  - Group by category (Strength, Agility, etc.) as per the website (observed categories).
  - Empty state identical to Suggestions.

### 2.9 M+ Upgrades & M+ Affixes
- `features/mplus/mplus_screen.dart`:
  - Show current weekly affix rotation using `weekly_affixes` (join with `mythic_affixes`).
  - If `weekly_affixes` empty, fall back to list of all affixes with explanation.
- Could combine both into one screen with tabs.

### 2.10 Classes
- Already have Class Builder. Could keep navigation pointing to existing Class tab; rename as needed.

### 2.11 Static Pages (Contact, About, Admin)
- `features/static/webview_screen.dart`:
  - Use `webview_flutter` to load corresponding routes from the website (e.g., `/contact`).
  - Simple wrapper.

### 2.12 Settings → Data Import
- Already implemented build import/export; no change.

---

## Phase 3: Polish & Integration

### 3.1 Home Screen
- Add new cards for Affixes, Dungeon Routes, WeakAuras, Items (affix suggestions), Suggestions, Maps, M+.
- Possibly split into two tabs: "Character" vs "Reference".
- Ensure grid stays 2-column on mobile; scrollable.

### 3.2 Cross-Linking
- Affix detail may list enchants that grant that affix (requires linking enchant → affix; not currently in model). Could be future.
- Dungeon route detail could integrate with affix notes.
- Weakauras may link to relevant affixes or classes (future).

### 3.3 Offline & Performance
- All data from assets → instant offline access.
- Lazy-load image network (dungeon route images) with caching.

### 3.4 Testing
- Unit tests for each model serialization against sample JSON.
- Widget tests for each new screen existence and empty states.
- Integration test: full data load and display counts.

### 3.5 Linting & Analyzer
- Ensure zero warnings & errors (`flutter analyze`).

### 3.6 Icons
- Add icons for Affix, Dungeon, WA, etc. using material icons or custom assets later.

---

## Phase 4: Distribution

Same as before (web, Android/iOS).

---

## Tech Debt

- **Dart 3.11.5 enum regression** — keep using class-based enums until fixed.
- **Hermes wrapper** — maintain openai prefix logic for remote providers.
- **Data freshness** — implement a manual "Refresh data" option in Settings to re-run fetch script; currently manual process.

---

## Session Handoff

1. `cd /home/synth/projects/open_ascension`
2. `flutter pub get`
3. `flutter analyze` — verify 0 errors
4. Pick a task above, implement, update this file, commit & push.
