import 'package:flutter/foundation.dart';

@immutable
class ItemAffixCategory {
  final String id;
  final String name;
  final int affixCount;
  final List<ItemAffix> affixes;

  const ItemAffixCategory({
    required this.id,
    required this.name,
    required this.affixCount,
    required this.affixes,
  });

  factory ItemAffixCategory.fromJson(Map<String, dynamic> json) =>
      ItemAffixCategory(
        id: json['id'] as String,
        name: json['name'] as String,
        affixCount: json['affix_count'] as int,
        affixes: (json['affixes'] as List<dynamic>)
            .map((item) => ItemAffix.fromJson(item as Map<String, dynamic>))
            .toList(growable: false),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'affix_count': affixCount,
        'affixes': affixes.map((a) => a.toJson()).toList(growable: false),
      };
}

@immutable
class ItemAffix {
  final String name;
  final String stats;

  const ItemAffix({
    required this.name,
    required this.stats,
  });

  factory ItemAffix.fromJson(Map<String, dynamic> json) => ItemAffix(
        name: json['name'] as String,
        stats: json['stats'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'stats': stats,
      };
}
