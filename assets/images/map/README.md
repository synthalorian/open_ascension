# Map Images

Map images for Azeroth (Eastern Kingdoms + Kalimdor) and Outlands are not yet available.

Public CDN sources (wow.zamimg.com, wowhead.com, wago.tools, db.ascension.gg) do not serve
static map images for these zones. The Maps feature flag (page_maps) is currently disabled
in feature_flags.json.

When maps are needed, consider:
1. Using the Wowhead dynamic map embed (https://www.wowhead.com/wow/map/azeroth)
2. Extracting map textures from WoW game data (mapXX_XX.blp files)
3. Rendering maps from the Wago.tools API with proper authentication
4. Using static images from the WoW wiki/media archives
