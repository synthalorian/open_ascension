import 'package:flutter/foundation.dart';

@immutable
class Affix {
  final String id;
  final String name;
  final String? summary;
  final String? description;
  final String? ascensionNotes;
  final String? tips;
  final String? iconUrl;
  final int? sortOrder;
  final String? createdAt;
  final String? updatedAt;

  const Affix({
    required this.id,
    required this.name,
    this.summary,
    this.description,
    this.ascensionNotes,
    this.tips,
    this.iconUrl,
    this.sortOrder,
    this.createdAt,
    this.updatedAt,
  });

  factory Affix.fromJson(Map<String, dynamic> json) => Affix(
        id: json['id'] as String,
        name: json['name'] as String,
        summary: json['summary'] as String?,
        description: json['description'] as String?,
        ascensionNotes: json['ascension_notes'] as String?,
        tips: json['tips'] as String?,
        iconUrl: json['icon_url'] as String?,
        sortOrder: json['sort_order'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'summary': summary,
        'description': description,
        'ascension_notes': ascensionNotes,
        'tips': tips,
        'icon_url': iconUrl,
        'sort_order': sortOrder,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
