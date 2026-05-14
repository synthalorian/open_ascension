import 'package:flutter/foundation.dart';

@immutable
class FeatureFlag {
  final String id;
  final String flagKey;
  final bool enabled;
  final String? description;
  final String? createdAt;
  final String? updatedAt;

  const FeatureFlag({
    required this.id,
    required this.flagKey,
    required this.enabled,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory FeatureFlag.fromJson(Map<String, dynamic> json) => FeatureFlag(
        id: json['id'] as String,
        flagKey: json['flag_key'] as String,
        enabled: json['enabled'] as bool,
        description: json['description'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'flag_key': flagKey,
        'enabled': enabled,
        'description': description,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
