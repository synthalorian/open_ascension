// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimaryStats _$PrimaryStatsFromJson(Map<String, dynamic> json) => PrimaryStats(
  strength: (json['strength'] as num?)?.toInt() ?? 0,
  agility: (json['agility'] as num?)?.toInt() ?? 0,
  stamina: (json['stamina'] as num?)?.toInt() ?? 0,
  intellect: (json['intellect'] as num?)?.toInt() ?? 0,
  spirit: (json['spirit'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PrimaryStatsToJson(PrimaryStats instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'agility': instance.agility,
      'stamina': instance.stamina,
      'intellect': instance.intellect,
      'spirit': instance.spirit,
    };

SecondaryStats _$SecondaryStatsFromJson(Map<String, dynamic> json) =>
    SecondaryStats(
      health: (json['health'] as num?)?.toInt() ?? 0,
      maxMana: (json['maxMana'] as num?)?.toInt() ?? 0,
      armor: (json['armor'] as num?)?.toInt() ?? 0,
      dodgePercent: (json['dodgePercent'] as num?)?.toDouble() ?? 0,
      parryPercent: (json['parryPercent'] as num?)?.toDouble() ?? 0,
      blockPercent: (json['blockPercent'] as num?)?.toDouble() ?? 0,
      blockValue: (json['blockValue'] as num?)?.toInt() ?? 0,
      critPercent: (json['critPercent'] as num?)?.toDouble() ?? 0,
      hitPercent: (json['hitPercent'] as num?)?.toDouble() ?? 0,
      attackPower: (json['attackPower'] as num?)?.toInt() ?? 0,
      spellPower: (json['spellPower'] as num?)?.toInt() ?? 0,
      healingPower: (json['healingPower'] as num?)?.toInt() ?? 0,
      hastePercent: (json['hastePercent'] as num?)?.toDouble() ?? 0,
      expertise: (json['expertise'] as num?)?.toDouble() ?? 0,
      resilience: (json['resilience'] as num?)?.toInt() ?? 0,
      pvpPower: (json['pvpPower'] as num?)?.toInt() ?? 0,
      combatRatingArmorPen:
          (json['combatRatingArmorPen'] as num?)?.toDouble() ?? 0,
      manaPer5: (json['manaPer5'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SecondaryStatsToJson(SecondaryStats instance) =>
    <String, dynamic>{
      'health': instance.health,
      'maxMana': instance.maxMana,
      'armor': instance.armor,
      'dodgePercent': instance.dodgePercent,
      'parryPercent': instance.parryPercent,
      'blockPercent': instance.blockPercent,
      'blockValue': instance.blockValue,
      'critPercent': instance.critPercent,
      'hitPercent': instance.hitPercent,
      'attackPower': instance.attackPower,
      'spellPower': instance.spellPower,
      'healingPower': instance.healingPower,
      'hastePercent': instance.hastePercent,
      'expertise': instance.expertise,
      'resilience': instance.resilience,
      'pvpPower': instance.pvpPower,
      'combatRatingArmorPen': instance.combatRatingArmorPen,
      'manaPer5': instance.manaPer5,
    };
