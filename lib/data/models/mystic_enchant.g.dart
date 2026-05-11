// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mystic_enchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MysticEnchant _$MysticEnchantFromJson(Map<String, dynamic> json) =>
    MysticEnchant(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      tier: $enumDecode(_$EnchantTierEnumMap, json['tier']),
    );

Map<String, dynamic> _$MysticEnchantToJson(MysticEnchant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tier': _$EnchantTierEnumMap[instance.tier]!,
    };

const _$EnchantTierEnumMap = {
  EnchantTier.uncommon: 'uncommon',
  EnchantTier.rare: 'rare',
  EnchantTier.epic: 'epic',
  EnchantTier.legendary: 'legendary',
};
