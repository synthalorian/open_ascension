#!/bin/bash
set -e

BASE_DIR="/home/synth/projects/open_ascension/assets/images"
mkdir -p "$BASE_DIR/dungeons" "$BASE_DIR/classes" "$BASE_DIR/races" "$BASE_DIR/map"

echo "============================================"
echo " Downloading all Open Ascension images"
echo "============================================"

# ============ DUNGEON ROUTE IMAGES ============
echo ""
echo "--- Downloading 13 dungeon route images ---"

declare -A DUNGEON_MAP
DUNGEON_MAP["c2ff324e-a9f9-41ed-b766-2716644abf45"]="hellfire_ramparts"
DUNGEON_MAP["3905293e-a0b7-4eb4-83c9-15cde20ea805"]="the_blood_furnace"
DUNGEON_MAP["dc03a14c-a4bb-4c35-a11e-0534140959a7"]="shattered_halls"
DUNGEON_MAP["65c388de-295e-43c4-9eb8-159cacffadea"]="auchenai_crypts"
DUNGEON_MAP["56db7590-702b-4866-b5a7-798250d7b206"]="mana_tombs"
DUNGEON_MAP["7f27b633-590e-46e8-8362-8922b467a7fc"]="sethekk_halls"
DUNGEON_MAP["a5b6dc4d-157b-468c-bdc8-4de11be08a55"]="shadow_labyrinth"
DUNGEON_MAP["170c552c-69ec-4a72-bc2c-9232d3da969f"]="the_botanica"
DUNGEON_MAP["af203fcb-206c-4e05-be76-fdc5bd4f7b64"]="mechanar"
DUNGEON_MAP["807c1665-b3f2-4f9d-9352-94e10f1deda7"]="arcatraz"
DUNGEON_MAP["59a6dd50-23a2-4105-8c81-5e054994c14a"]="slave_pens"
DUNGEON_MAP["bb856b52-b707-4d3f-8212-59a1f8d55214"]="underbog"
DUNGEON_MAP["6dd0a36c-8cb3-4840-b797-122e31a77f1f"]="steamvaults"

DUNGEON_FAILED=0

# Extract URLs from JSON for accuracy
python3 -c "
import json
with open('/home/synth/projects/open_ascension/assets/data/dungeon_route_images.json') as f:
    data = json.load(f)
for item in data:
    did = item['dungeon_id']
    url = item['image_url']
    print(f'{did}|{url}')
" > /tmp/dungeon_urls.txt

echo "  Using exact URLs from JSON..."
while IFS='|' read -r DID URL; do
    NAME="${DUNGEON_MAP[$DID]}"
    FILE="$BASE_DIR/dungeons/${NAME}.png"
    echo "  [DUNGEON] Downloading ${NAME}..."
    
    if curl -s -f -o "$FILE" "$URL" --max-time 30; then
        SIZE=$(stat -c%s "$FILE" 2>/dev/null || echo "0")
        echo "    OK: ${NAME}.png (${SIZE} bytes)"
    else
        echo "    FAILED: ${NAME} from exact URL"
        # Try fallbacks
        FALLBACK_URL="https://nzoibbcwvyrlhacuvocb.supabase.co/storage/v1/object/public/dungeon-routes/${DID}/route.png"
        if curl -s -f -o "$FILE" "$FALLBACK_URL" --max-time 30; then
            SIZE=$(stat -c%s "$FILE" 2>/dev/null || echo "0")
            echo "    OK (fallback): ${NAME}.png (${SIZE} bytes)"
        else
            echo "    FAILED completely: ${NAME}"
            DUNGEON_FAILED=$((DUNGEON_FAILED + 1))
        fi
    fi
    sleep 0.5
done < /tmp/dungeon_urls.txt

echo ""
echo "Dungeon download complete. Failed: $DUNGEON_FAILED"
ls -la "$BASE_DIR/dungeons/" 2>/dev/null || echo "(empty)"

# ============ CLASS ICONS ============
echo ""
echo "--- Downloading class icons (10 classes) ---"

BASE_URL="https://wow.zamimg.com/images/wow/icons/large"

CLASSES=(
    "warrior:ability_warrior_savageblow"
    "paladin:ability_paladin_holyprotection"
    "hunter:ability_hunter_masterscall"
    "rogue:ability_rogue_eviscerate"
    "priest:ability_priest_voidshift"
    "deathknight:spell_deathknight_bloodboil"
    "shaman:spell_nature_lightningbolt"
    "mage:spell_fire_firebolt02"
    "warlock:spell_shadow_metamorphosis"
    "druid:ability_druid_catform"
)

CLASS_FAILED=0
for ENTRY in "${CLASSES[@]}"; do
    NAME="${ENTRY%%:*}"
    ICON="${ENTRY##*:}"
    FILE="$BASE_DIR/classes/${NAME}.jpg"
    URL="${BASE_URL}/${ICON}.jpg"
    
    echo "  [CLASS] Downloading ${NAME} (${ICON})..."
    
    if curl -s -f -o "$FILE" "$URL" --max-time 30; then
        SIZE=$(stat -c%s "$FILE" 2>/dev/null || echo "0")
        echo "    OK: ${NAME}.jpg (${SIZE} bytes)"
    else
        echo "    FAILED: ${NAME}"
        CLASS_FAILED=$((CLASS_FAILED + 1))
    fi
    sleep 0.5
done

echo ""
echo "Class icons download complete. Failed: $CLASS_FAILED"
ls -la "$BASE_DIR/classes/" 2>/dev/null || echo "(empty)"

# ============ RACE ICONS ============
echo ""
echo "--- Downloading race icons (10 races) ---"

RACES=(
    "human:race_human_male"
    "dwarf:race_dwarf_male"
    "nightelf:race_nightelf_male"
    "gnome:race_gnome_male"
    "draenei:race_draenei_male"
    "orc:race_orc_male"
    "troll:race_troll_male"
    "tauren:race_tauren_male"
    "undead:race_undead_male"
    "bloodelf:race_bloodelf_male"
)

RACE_FAILED=0
for ENTRY in "${RACES[@]}"; do
    NAME="${ENTRY%%:*}"
    ICON="${ENTRY##*:}"
    FILE="$BASE_DIR/races/${NAME}.jpg"
    URL="${BASE_URL}/${ICON}.jpg"
    
    echo "  [RACE] Downloading ${NAME} (${ICON})..."
    
    if curl -s -f -o "$FILE" "$URL" --max-time 30; then
        SIZE=$(stat -c%s "$FILE" 2>/dev/null || echo "0")
        echo "    OK: ${NAME}.jpg (${SIZE} bytes)"
    else
        echo "    FAILED: ${NAME}"
        RACE_FAILED=$((RACE_FAILED + 1))
    fi
    sleep 0.5
done

echo ""
echo "Race icons download complete. Failed: $RACE_FAILED"
ls -la "$BASE_DIR/races/" 2>/dev/null || echo "(empty)"

# ============ MAP IMAGES ============
echo ""
echo "--- Downloading world maps ---"

echo "  [MAP] Trying to download Azeroth map..."

MAP_FILE="$BASE_DIR/map/azeroth.jpg"
download_map() {
    local URL="$1"
    local FILE="$2"
    local LABEL="$3"
    
    if curl -s -f -o "$FILE" "$URL" --max-time 30; then
        local SIZE=$(stat -c%s "$FILE" 2>/dev/null || echo "0")
        if [ "$SIZE" -gt 5000 ]; then
            echo "    OK (${LABEL}): $(basename $FILE) (${SIZE} bytes)"
            return 0
        else
            echo "    Too small (${SIZE} bytes) from ${LABEL}"
            return 1
        fi
    else
        return 1
    fi
}

download_map "https://wow.zamimg.com/uploads/screenshots/normal/1729-azeroth.jpg" "$MAP_FILE" "zamimg azeroth" || \
download_map "https://cdn.wowhead.com/images/wow/maps/en/azeroth.jpg" "$MAP_FILE" "wowhead azeroth" || \
download_map "https://wow.zamimg.com/images/wow/maps/en/azeroth.jpg" "$MAP_FILE" "zamimg maps en" || \
echo "    All Azeroth map sources failed"

sleep 0.5

OUTLAND_FILE="$BASE_DIR/map/outlands.jpg"
echo "  [MAP] Trying to download Outlands map..."

download_map "https://wow.zamimg.com/images/wow/maps/en/outland.jpg" "$OUTLAND_FILE" "zamimg outland" || \
download_map "https://cdn.wowhead.com/images/wow/maps/en/outland.jpg" "$OUTLAND_FILE" "wowhead outland" || \
download_map "https://wow.zamimg.com/uploads/screenshots/normal/1730-outland.jpg" "$OUTLAND_FILE" "zamimg screenshots outland" || \
echo "    All Outlands map sources failed"

echo ""
echo "Map download complete."
ls -la "$BASE_DIR/map/" 2>/dev/null || echo "(empty)"

# ============ SUMMARY ============
echo ""
echo "============================================"
echo " DOWNLOAD SUMMARY"
echo "============================================"
echo ""
echo "Dungeons : $(ls -1 "$BASE_DIR/dungeons/" 2>/dev/null | wc -l) files (${DUNGEON_FAILED} failed)"
echo "Classes  : $(ls -1 "$BASE_DIR/classes/" 2>/dev/null | wc -l) files (${CLASS_FAILED} failed)"
echo "Races    : $(ls -1 "$BASE_DIR/races/" 2>/dev/null | wc -l) files (${RACE_FAILED} failed)"
echo "Maps     : $(ls -1 "$BASE_DIR/map/" 2>/dev/null | wc -l) files"
echo ""
echo "File sizes:"
du -sh "$BASE_DIR/dungeons/" "$BASE_DIR/classes/" "$BASE_DIR/races/" "$BASE_DIR/map/" 2>/dev/null