// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Build _$BuildFromJson(Map<String, dynamic> json) => Build(
  id: json['id'] as String,
  name: json['name'] as String,
  raceId: json['raceId'] as String?,
  isClassless: json['isClassless'] as bool,
  realm: json['realm'] as String?,
  abilityIds: (json['abilityIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  talentIds: (json['talentIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  enchantSlots: Map<String, String>.from(json['enchantSlots'] as Map),
  stats: json['stats'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$BuildToJson(Build instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'raceId': instance.raceId,
  'isClassless': instance.isClassless,
  'realm': instance.realm,
  'abilityIds': instance.abilityIds,
  'talentIds': instance.talentIds,
  'enchantSlots': instance.enchantSlots,
  'stats': instance.stats,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'notes': instance.notes,
};
