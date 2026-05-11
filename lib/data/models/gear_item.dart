import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'gear_item.g.dart';

enum GearSlot {
  head, neck, shoulder, chest, wrist, hands, waist, legs, feet,
  mainHand, offHand, twoHand, ranged, relic,
  wrist1, wrist2, // ring1/ring2
}

extension GearSlotX on GearSlot {
  String get displayName => const {
    GearSlot.head: 'Head',
    GearSlot.neck: 'Neck',
    GearSlot.shoulder: 'Shoulder',
    GearSlot.chest: 'Chest',
    GearSlot.wrist: 'Wrist',
    GearSlot.hands: 'Hands',
    GearSlot.waist: 'Waist',
    GearSlot.legs: 'Legs',
    GearSlot.feet: 'Feet',
    GearSlot.mainHand: 'Main Hand',
    GearSlot.offHand: 'Off Hand',
    GearSlot.twoHand: 'Two-Hand',
    GearSlot.ranged: 'Ranged',
    GearSlot.relic: 'Relic',
    GearSlot.wrist1: 'Ring 1',
    GearSlot.wrist2: 'Ring 2',
  }[this]!;
}

enum GearType {
  armor, weapon,
}

enum ArmorType {
  cloth, leather, mail, plate,
}

enum WeaponType {
  axe, sword, mace, dagger, fist, polearm, staff, bow, crossbow, wand,
  thrown, fistWeapon,
}

extension WeaponTypeX on WeaponType {
  String get displayName => const {
    WeaponType.axe: 'Axe',
    WeaponType.sword: 'Sword',
    WeaponType.mace: 'Mace',
    WeaponType.dagger: 'Dagger',
    WeaponType.fist: 'Fist',
    WeaponType.polearm: 'Polearm',
    WeaponType.staff: 'Staff',
    WeaponType.bow: 'Bow',
    WeaponType.crossbow: 'Crossbow',
    WeaponType.wand: 'Wand',
    WeaponType.thrown: 'Thrown',
    WeaponType.fistWeapon: 'Fist Weapon',
  }[this]!;
}

enum GearRarity {
  common, uncommon, rare, epic, legendary,
}

extension GearRarityX on GearRarity {
  String get displayName => const {
    GearRarity.common: 'Common',
    GearRarity.uncommon: 'Uncommon',
    GearRarity.rare: 'Rare',
    GearRarity.epic: 'Epic',
    GearRarity.legendary: 'Legendary',
  }[this]!;

  Color get color => const {
    GearRarity.common: Colors.grey,
    GearRarity.uncommon: Color(0xFF1EFF00),
    GearRarity.rare: Colors.blue,
    GearRarity.epic: Color(0xFFA335EE),
    GearRarity.legendary: Color(0xFFFF8000),
  }[this]!;
}

@JsonSerializable()
class GearItem {
  final String id;
  final String name;
  final GearSlot slot;
  final GearType type;
  final ArmorType? armorType;
  final WeaponType? weaponType;
  final GearRarity rarity;
  final int itemLevel;
  final int requiredLevel;
  final String? source; // Naxx, Ulduar, ICC, etc.
  final Map<String, dynamic> stats;

  const GearItem({
    required this.id,
    required this.name,
    required this.slot,
    required this.type,
    this.armorType,
    this.weaponType,
    required this.rarity,
    required this.itemLevel,
    required this.requiredLevel,
    this.source,
    required this.stats,
  });

  factory GearItem.fromJson(Map<String, dynamic> json) => _$GearItemFromJson(json);
  Map<String, dynamic> toJson() => _$GearItemToJson(this);
}
