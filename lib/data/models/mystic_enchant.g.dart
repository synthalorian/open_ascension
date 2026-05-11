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
      slot: $enumDecode(_$EnchantSlotEnumMap, json['slot']),
      tier: $enumDecode(_$EnchantTierEnumMap, json['tier']),
      classRestrictions: (json['classRestrictions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      minLevel: (json['minLevel'] as num?)?.toInt(),
      stats: json['stats'] as Map<String, dynamic>,
      goldCost: (json['goldCost'] as num?)?.toInt(),
      materials: (json['materials'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      icon: json['icon'] as String?,
      isClassless: json['isClassless'] as bool? ?? false,
    );

Map<String, dynamic> _$MysticEnchantToJson(MysticEnchant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'slot': _$EnchantSlotEnumMap[instance.slot]!,
      'tier': _$EnchantTierEnumMap[instance.tier]!,
      'classRestrictions': instance.classRestrictions,
      'minLevel': instance.minLevel,
      'stats': instance.stats,
      'goldCost': instance.goldCost,
      'materials': instance.materials,
      'icon': instance.icon,
      'isClassless': instance.isClassless,
    };

const _$EnchantSlotEnumMap = {
  EnchantSlot.weapon: 'weapon',
  EnchantSlot.mainHand: 'mainHand',
  EnchantSlot.offHand: 'offHand',
  EnchantSlot.head: 'head',
  EnchantSlot.chest: 'chest',
  EnchantSlot.legs: 'legs',
  EnchantSlot.feet: 'feet',
};

const _$EnchantTierEnumMap = {
  EnchantTier.common: 'common',
  EnchantTier.uncommon: 'uncommon',
  EnchantTier.rare: 'rare',
  EnchantTier.epic: 'epic',
  EnchantTier.legendary: 'legendary',
};
