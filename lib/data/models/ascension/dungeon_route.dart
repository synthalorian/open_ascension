import 'package:flutter/foundation.dart';

@immutable
class DungeonRoute {
  final String id;
  final String name;
  final String? notes;
  final String? expansion;
  final String? difficultyNotes;
  final String? affixNotes;
  final String? groupTips;
  final String? seasonLabel;
  final Map<String, dynamic>? extraData;
  final String? createdAt;
  final String? updatedAt;

  const DungeonRoute({
    required this.id,
    required this.name,
    this.notes,
    this.expansion,
    this.difficultyNotes,
    this.affixNotes,
    this.groupTips,
    this.seasonLabel,
    this.extraData,
    this.createdAt,
    this.updatedAt,
  });

  factory DungeonRoute.fromJson(Map<String, dynamic> json) => DungeonRoute(
        id: json['id'] as String,
        name: json['name'] as String,
        notes: json['notes'] as String?,
        expansion: json['expansion'] as String?,
        difficultyNotes: json['difficulty_notes'] as String?,
        affixNotes: json['affix_notes'] as String?,
        groupTips: json['group_tips'] as String?,
        seasonLabel: json['season_label'] as String?,
        extraData:
            (json['extra_data'] as Map<String, dynamic>?)?.cast<String, dynamic>(),
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'notes': notes,
        'expansion': expansion,
        'difficulty_notes': difficultyNotes,
        'affix_notes': affixNotes,
        'group_tips': groupTips,
        'season_label': seasonLabel,
        'extra_data': extraData,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
