import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/ascension/affix.dart';
import '../models/ascension/dungeon_route.dart';
import '../models/ascension/dungeon_route_image.dart';
import '../models/ascension/server.dart';
import '../models/ascension/feature_flag.dart';
import '../models/ascension/page_content.dart';
import '../models/ascension/feature_suggestion.dart';
import '../models/ascension/weakaura.dart';
import '../models/ascension/weakaura_suggestion.dart';
import '../models/ascension/enchant_suggestion.dart';
import '../models/ascension/enchant_tag.dart';
import '../models/ascension/item_affix_suggestion.dart';
import '../models/ascension/weekly_affix.dart';
import '../models/ascension/tag.dart';
import '../mystic_enchant.dart';

/// Base helper to load and parse a JSON asset into a list of [T].
Future<List<T>> _loadJsonAsset<T>({
  required String assetPath,
  required T Function(Map<String, dynamic>) fromJson,
}) async {
  final jsonStr = await rootBundle.loadString(assetPath);
  final List<dynamic> raw = json.decode(jsonStr);
  return raw
      .map((item) => fromJson(item as Map<String, dynamic>))
      .toList(growable: false);
}

// ---------------------------------------------------------------------------
// Providers for each Ascension table
// ---------------------------------------------------------------------------

/// All mystic enchants (from asset). Note: the existing MysticEnchant model is separate.
final ascensionEnchantsProvider =
    FutureProvider.autoDispose<List<MysticEnchant>>((ref) async {
  // We'll load from the existing MysticEnchant model (hardcoded) for now.
  // Later we'll switch to asset-based list.
  // Since the existing MysticEnchant class is generated differently,
  // we will return the static list for now.
  await Future.delayed(Duration.zero); // keep async
  return MysticEnchant.entries;
});

/// Affixes (mythic_affixes)
final affixesProvider = FutureProvider.autoDispose<List<Affix>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/mythic_affixes.json',
    fromJson: (json) => Affix.fromJson(json),
  );
});

/// Dungeon routes
final dungeonRoutesProvider = FutureProvider.autoDispose<List<DungeonRoute>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/dungeon_routes.json',
    fromJson: (json) => DungeonRoute.fromJson(json),
  );
});

/// Images for dungeon routes, keyed by dungeonId
final dungeonRouteImagesProvider =
    FutureProvider.autoDispose<List<DungeonRouteImage>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/dungeon_route_images.json',
    fromJson: (json) => DungeonRouteImage.fromJson(json),
  );
});

/// Servers (realms)
final serversProvider = FutureProvider.autoDispose<List<Server>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/servers.json',
    fromJson: (json) => Server.fromJson(json),
  );
});

/// Feature flags (internal toggles)
final featureFlagsProvider = FutureProvider.autoDispose<List<FeatureFlag>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/feature_flags.json',
    fromJson: (json) => FeatureFlag.fromJson(json),
  );
});

/// Page content (static pages like About, Contact)
final pageContentProvider = FutureProvider.autoDispose<List<PageContent>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/page_content.json',
    fromJson: (json) => PageContent.fromJson(json),
  );
});

/// Community feature suggestions
final featureSuggestionsProvider =
    FutureProvider.autoDispose<List<FeatureSuggestion>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/feature_suggestions.json',
    fromJson: (json) => FeatureSuggestion.fromJson(json),
  );
});

/// Weakauras (empty currently)
final weakaurasProvider = FutureProvider.autoDispose<List<Weakaura>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/weakauras.json',
    fromJson: (json) => Weakaura.fromJson(json),
  );
});

/// Weakaura suggestions (empty)
final weakauraSuggestionsProvider =
    FutureProvider.autoDispose<List<WeakauraSuggestion>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/weakaura_suggestions.json',
    fromJson: (json) => WeakauraSuggestion.fromJson(json),
  );
});

/// Enchant suggestions (empty)
final enchantSuggestionsProvider =
    FutureProvider.autoDispose<List<EnchantSuggestion>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/enchant_suggestions.json',
    fromJson: (json) => EnchantSuggestion.fromJson(json),
  );
});

/// Enchant tags (empty)
final enchantTagsProvider = FutureProvider.autoDispose<List<EnchantTag>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/enchant_tags.json',
    fromJson: (json) => EnchantTag.fromJson(json),
  );
});

/// Item affix suggestions (empty)
final itemAffixSuggestionsProvider =
    FutureProvider.autoDispose<List<ItemAffixSuggestion>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/item_affix_suggestions.json',
    fromJson: (json) => ItemAffixSuggestion.fromJson(json),
  );
});

/// Weekly affixes (empty)
final weeklyAffixesProvider = FutureProvider.autoDispose<List<WeeklyAffix>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/weekly_affixes.json',
    fromJson: (json) => WeeklyAffix.fromJson(json),
  );
});

/// Map tags (empty)
final tagsProvider = FutureProvider.autoDispose<List<Tag>>((ref) {
  return _loadJsonAsset(
    assetPath: 'assets/data/tags.json',
    fromJson: (json) => Tag.fromJson(json),
  );
});
