// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gear_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GearItem _$GearItemFromJson(Map<String, dynamic> json) => GearItem(
  id: json['id'] as String,
  name: json['name'] as String,
  slot: $enumDecode(_$GearSlotEnumMap, json['slot']),
  type: $enumDecode(_$GearTypeEnumMap, json['type']),
  armorType: $enumDecodeNullable(_$ArmorTypeEnumMap, json['armorType']),
  weaponType: $enumDecodeNullable(_$WeaponTypeEnumMap, json['weaponType']),
  rarity: $enumDecode(_$GearRarityEnumMap, json['rarity']),
  itemLevel: (json['itemLevel'] as num).toInt(),
  requiredLevel: (json['requiredLevel'] as num).toInt(),
  source: json['source'] as String?,
  stats: json['stats'] as Map<String, dynamic>,
);

Map<String, dynamic> _$GearItemToJson(GearItem instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slot': _$GearSlotEnumMap[instance.slot]!,
  'type': _$GearTypeEnumMap[instance.type]!,
  'armorType': _$ArmorTypeEnumMap[instance.armorType],
  'weaponType': _$WeaponTypeEnumMap[instance.weaponType],
  'rarity': _$GearRarityEnumMap[instance.rarity]!,
  'itemLevel': instance.itemLevel,
  'requiredLevel': instance.requiredLevel,
  'source': instance.source,
  'stats': instance.stats,
};

const _$GearSlotEnumMap = {
  GearSlot.head: 'head',
  GearSlot.neck: 'neck',
  GearSlot.shoulder: 'shoulder',
  GearSlot.chest: 'chest',
  GearSlot.wrist: 'wrist',
  GearSlot.hands: 'hands',
  GearSlot.waist: 'waist',
  GearSlot.legs: 'legs',
  GearSlot.feet: 'feet',
  GearSlot.mainHand: 'mainHand',
  GearSlot.offHand: 'offHand',
  GearSlot.twoHand: 'twoHand',
  GearSlot.ranged: 'ranged',
  GearSlot.relic: 'relic',
  GearSlot.wrist1: 'wrist1',
  GearSlot.wrist2: 'wrist2',
};

const _$GearTypeEnumMap = {GearType.armor: 'armor', GearType.weapon: 'weapon'};

const _$ArmorTypeEnumMap = {
  ArmorType.cloth: 'cloth',
  ArmorType.leather: 'leather',
  ArmorType.mail: 'mail',
  ArmorType.plate: 'plate',
};

const _$WeaponTypeEnumMap = {
  WeaponType.axe: 'axe',
  WeaponType.sword: 'sword',
  WeaponType.mace: 'mace',
  WeaponType.dagger: 'dagger',
  WeaponType.fist: 'fist',
  WeaponType.polearm: 'polearm',
  WeaponType.staff: 'staff',
  WeaponType.bow: 'bow',
  WeaponType.crossbow: 'crossbow',
  WeaponType.wand: 'wand',
  WeaponType.thrown: 'thrown',
  WeaponType.fistWeapon: 'fistWeapon',
};

const _$GearRarityEnumMap = {
  GearRarity.common: 'common',
  GearRarity.uncommon: 'uncommon',
  GearRarity.rare: 'rare',
  GearRarity.epic: 'epic',
  GearRarity.legendary: 'legendary',
};
