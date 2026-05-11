import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mystic_enchant.g.dart';

enum EnchantSlot {
  weapon, mainHand, offHand, head, chest, legs, feet,
}

extension EnchantSlotX on EnchantSlot {
  String get displayName {
    return const {
      EnchantSlot.weapon: 'Weapon',
      EnchantSlot.mainHand: 'Main Hand',
      EnchantSlot.offHand: 'Off Hand',
      EnchantSlot.head: 'Head',
      EnchantSlot.chest: 'Chest',
      EnchantSlot.legs: 'Legs',
      EnchantSlot.feet: 'Feet',
    }[this]!;
  }
}

enum EnchantTier {
  common, uncommon, rare, epic, legendary,
}

extension EnchantTierX on EnchantTier {
  String get displayName {
    return const {
      EnchantTier.common: 'Common',
      EnchantTier.uncommon: 'Uncommon',
      EnchantTier.rare: 'Rare',
      EnchantTier.epic: 'Epic',
      EnchantTier.legendary: 'Legendary',
    }[this]!;
  }

  Color get color {
    return const {
      EnchantTier.common: Colors.grey,
      EnchantTier.uncommon: Color(0xFF1EFF00),
      EnchantTier.rare: Colors.blue,
      EnchantTier.epic: Colors.purple,
      EnchantTier.legendary: Color(0xFFFF8000),
    }[this]!;
  }

  int get indexValue => index;
}

@JsonSerializable()
class MysticEnchant {
  final String id;
  final String name;
  final String description;
  final EnchantSlot slot;
  final EnchantTier tier;
  final List<String>? classRestrictions;
  final int? minLevel;
  final Map<String, dynamic> stats;
  final int? goldCost;
  final List<String> materials;
  final String? icon;
  final bool isClassless;

  const MysticEnchant({
    required this.id,
    required this.name,
    required this.description,
    required this.slot,
    required this.tier,
    this.classRestrictions,
    this.minLevel,
    required this.stats,
    this.goldCost,
    required this.materials,
    this.icon,
    this.isClassless = false,
  });

  factory MysticEnchant.fromJson(Map<String, dynamic> json) =>
      _$MysticEnchantFromJson(json);
  Map<String, dynamic> toJson() => _$MysticEnchantToJson(this);
}

const sampleEnchants = <MysticEnchant>[
  // Weapon enchants
  MysticEnchant(id: 'w_might', name: 'Might of the Titans',
      description: '+40 Attack Power', slot: EnchantSlot.weapon,
      tier: EnchantTier.rare, stats: {'attackPower': 40},
      materials: ['Titan Rune'], goldCost: 5000),
  MysticEnchant(id: 'w_frost_strike', name: 'Frost Strike',
      description: '+25 Attack Power, chance to slow', slot: EnchantSlot.weapon,
      tier: EnchantTier.epic, stats: {'attackPower': 25, 'slowChance': 0.3},
      materials: ['Frost Rune', 'Ice Shard'], goldCost: 8000),
  MysticEnchant(id: 'w_blood_fury', name: 'Blood Fury',
      description: '+60 Attack Power, lifesteal 3%', slot: EnchantSlot.weapon,
      tier: EnchantTier.legendary, stats: {'attackPower': 60, 'lifesteal': 0.03},
      materials: ['Bloodstone', 'Shadow Essence'], goldCost: 15000),
  MysticEnchant(id: 'w_arcane_power', name: 'Arcane Power',
      description: '+50 Spell Power', slot: EnchantSlot.weapon,
      tier: EnchantTier.rare, stats: {'spellPower': 50},
      materials: ['Arcane Crystal'], goldCost: 4000),
  MysticEnchant(id: 'w_savage', name: 'Savage Strikes',
      description: '+30 Attack Power, +10% crit', slot: EnchantSlot.weapon,
      tier: EnchantTier.uncommon, stats: {'attackPower': 30, 'crit': 0.1},
      materials: ['Sharp Blade'], goldCost: 2000),
  MysticEnchant(id: 'w_moonfire', name: 'Moonfire',
      description: '+35 Spell Power, heals 2% on crit', slot: EnchantSlot.weapon,
      tier: EnchantTier.epic, stats: {'spellPower': 35, 'healOnCrit': 0.02},
      materials: ['Moonstone', 'Starlight Dew'], goldCost: 7000),
  // Head enchants
  MysticEnchant(id: 'h_stoneguard', name: 'Stoneguard',
      description: '+100 Stamina', slot: EnchantSlot.head,
      tier: EnchantTier.rare, stats: {'stamina': 100},
      materials: ['Earthstone'], goldCost: 3000),
  MysticEnchant(id: 'h_clear_sight', name: 'Clear Sight',
      description: '+40 Intellect, +5% crit', slot: EnchantSlot.head,
      tier: EnchantTier.uncommon, stats: {'intellect': 40, 'crit': 0.05},
      materials: ['Crystal Eye'], goldCost: 1500),
  MysticEnchant(id: 'h_titan_will', name: 'Titan Will',
      description: '+80 Strength, +60 Stamina, +15% resist', slot: EnchantSlot.head,
      tier: EnchantTier.legendary, stats: {'strength': 80, 'stamina': 60, 'resistance': 0.15},
      materials: ['Titan Essence', 'Void Crystal'], goldCost: 20000),
  MysticEnchant(id: 'h_elune_blessing', name: 'Blessing of Elune',
      description: '+45 Spirit, +20% heal power', slot: EnchantSlot.head,
      tier: EnchantTier.epic, stats: {'spirit': 45, 'healPower': 0.2},
      materials: ['Moonlight', 'Holy Water'], goldCost: 6000),
  // Chest enchants
  MysticEnchant(id: 'c_ironhide', name: 'Ironhide',
      description: '+200 Stamina, +5% armor', slot: EnchantSlot.chest,
      tier: EnchantTier.rare, stats: {'stamina': 200, 'armor': 0.05},
      materials: ['Ironplate'], goldCost: 3500),
  MysticEnchant(id: 'c_arcane_resilience', name: 'Arcane Resilience',
      description: '+60 Intellect, +80 Stamina, +30% magic resist', slot: EnchantSlot.chest,
      tier: EnchantTier.epic, stats: {'intellect': 60, 'stamina': 80, 'magicResist': 0.3},
      materials: ['Arcane Shield', 'Mana Crystal'], goldCost: 7500),
  MysticEnchant(id: 'c_titan_forged', name: 'Titan Forged Plate',
      description: '+300 Stamina, +10% armor, +20% block', slot: EnchantSlot.chest,
      tier: EnchantTier.legendary, stats: {'stamina': 300, 'armor': 0.1, 'block': 0.2},
      materials: ['Titan Plate', 'Azerite'], goldCost: 25000),
  MysticEnchant(id: 'c_shadowweave', name: 'Shadowweave',
      description: '+70 Spirit, +40% crit on spells', slot: EnchantSlot.chest,
      tier: EnchantTier.rare, stats: {'spirit': 70, 'spellCrit': 0.4},
      materials: ['Shadow Silk'], goldCost: 4000),
  // Leg enchants
  MysticEnchant(id: 'l_heavy_plating', name: 'Heavy Plating',
      description: '+150 Stamina, +8% armor', slot: EnchantSlot.legs,
      tier: EnchantTier.rare, stats: {'stamina': 150, 'armor': 0.08},
      materials: ['Steel Plate'], goldCost: 2500),
  MysticEnchant(id: 'l_springstep', name: 'Springstep',
      description: '+40 Agility, +10% dodge', slot: EnchantSlot.legs,
      tier: EnchantTier.uncommon, stats: {'agility': 40, 'dodge': 0.1},
      materials: ['Spring Coils'], goldCost: 1200),
  MysticEnchant(id: 'l_titan_stride', name: 'Titan Stride',
      description: '+100 Strength, +100 Stamina, +15% dodge', slot: EnchantSlot.legs,
      tier: EnchantTier.legendary, stats: {'strength': 100, 'stamina': 100, 'dodge': 0.15},
      materials: ['Titan Leggings', 'Earth Essence'], goldCost: 18000),
  // Feet enchants
  MysticEnchant(id: 'f_swiftness', name: 'Swiftness',
      description: '+60 Agility, +5% haste', slot: EnchantSlot.feet,
      tier: EnchantTier.rare, stats: {'agility': 60, 'haste': 0.05},
      materials: ['Wind Feather'], goldCost: 2000),
  MysticEnchant(id: 'f_titan_runner', name: 'Titan Runner',
      description: '+50 Stamina, +10% haste, +10% dodge', slot: EnchantSlot.feet,
      tier: EnchantTier.epic, stats: {'stamina': 50, 'haste': 0.1, 'dodge': 0.1},
      materials: ['Titan Boots', 'Swift Rune'], goldCost: 9000),
];
