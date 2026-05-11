import 'package:json_annotation/json_annotation.dart';

part 'talent.g.dart';

@JsonSerializable()
class Talent {
  final String id;
  final String name;
  final String description;
  final String classId;
  final String? specName;
  final int tier;
  final int row;
  final int column;
  final int maxRank;
  final String? prereqTalentId;
  final String? icon;
  final bool isClassless;

  const Talent({
    required this.id,
    required this.name,
    required this.description,
    required this.classId,
    this.specName,
    required this.tier,
    required this.row,
    required this.column,
    this.maxRank = 1,
    this.prereqTalentId,
    this.icon,
    this.isClassless = true,
  });

  factory Talent.fromJson(Map<String, dynamic> json) => _$TalentFromJson(json);
  Map<String, dynamic> toJson() => _$TalentToJson(this);
}

// Sample WotLK talents for OG classes
const sampleTalents = <Talent>[
  // WARRIOR - ARMS
  Talent(id: 'w_a_tough', name: 'Toughness', description: 'Reduces damage taken by 2/4/6/8/10%.', classId: 'warrior', specName: 'Arms', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_a_twohand', name: 'Two-Handed Weapons Spec', description: 'Increases 2H damage by 2/4/6/8/10%.', classId: 'warrior', specName: 'Arms', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_a_battlemaster', name: 'Battle Master', description: 'Battle Stance increases threat.', classId: 'warrior', specName: 'Arms', tier: 1, row: 3, column: 3),
  Talent(id: 'w_a_improvedheroic', name: 'Improved Heroic Strike', description: 'Reduces HS cooldown.', classId: 'warrior', specName: 'Arms', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_a_improvedslam', name: 'Improved Slam', description: 'Slam damage increased.', classId: 'warrior', specName: 'Arms', tier: 2, row: 2, column: 2, maxRank: 5, prereqTalentId: 'w_a_twohand'),
  Talent(id: 'w_a_deadlycal', name: 'Deadly Calm', description: 'Execute at any rage when below 20% HP.', classId: 'warrior', specName: 'Arms', tier: 3, row: 1, column: 1),
  Talent(id: 'w_a_improvedexecute', name: 'Improved Execute', description: 'Execute damage increased.', classId: 'warrior', specName: 'Arms', tier: 3, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_a_mastery', name: 'Mastery: Arms', description: 'Heroic Strike, Slam, Execute deal bonus damage.', classId: 'warrior', specName: 'Arms', tier: 4, row: 1, column: 1),

  // WARRIOR - FURY
  Talent(id: 'w_f_tough', name: 'Toughness', description: 'Reduces damage taken by 2/4/6/8/10%.', classId: 'warrior', specName: 'Fury', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_f_dualspec', name: 'Dual Wielding Spec', description: 'Increases dual wield damage by 1/2/3/4/5%.', classId: 'warrior', specName: 'Fury', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_f_berserker', name: 'Berserker Stance', description: 'Increases damage in Berserker Stance.', classId: 'warrior', specName: 'Fury', tier: 1, row: 3, column: 3),
  Talent(id: 'w_f_improvedwhirlwind', name: 'Improved Whirlwind', description: 'Whirlwind costs less rage.', classId: 'warrior', specName: 'Fury', tier: 2, row: 1, column: 1, maxRank: 3, prereqTalentId: 'w_f_dualspec'),
  Talent(id: 'w_f_improvedbloodthirst', name: 'Improved Bloodthirst', description: 'Bloodthirst heals for more.', classId: 'warrior', specName: 'Fury', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'w_f_warstomp', name: 'War Stomp', description: 'Stun enemies in an area.', classId: 'warrior', specName: 'Fury', tier: 3, row: 1, column: 1),
  Talent(id: 'w_f_improvedenragement', name: 'Improved Enraged Regen', description: 'Enraged Regen heals more.', classId: 'warrior', specName: 'Fury', tier: 3, row: 2, column: 2, maxRank: 2),

  // WARRIOR - PROTECTION
  Talent(id: 'w_p_tough', name: 'Toughness', description: 'Reduces damage taken by 2/4/6/8/10%.', classId: 'warrior', specName: 'Protection', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_p_defensive', name: 'Defensive Stance', description: 'Increases armor in Defensive Stance.', classId: 'warrior', specName: 'Protection', tier: 1, row: 2, column: 2),
  Talent(id: 'w_p_laststand', name: 'Last Stand', description: 'Doubles max health for 10s.', classId: 'warrior', specName: 'Protection', tier: 2, row: 1, column: 1),
  Talent(id: 'w_p_improvedblock', name: 'Improved Block', description: 'Chance to block increased.', classId: 'warrior', specName: 'Protection', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_p_vigilance', name: 'Vigilance', description: 'Threat shared with another ally.', classId: 'warrior', specName: 'Protection', tier: 3, row: 1, column: 1),
  Talent(id: 'w_p_improveddevastate', name: 'Improved Devastate', description: 'Devastate damage increased.', classId: 'warrior', specName: 'Protection', tier: 3, row: 2, column: 2, maxRank: 3),

  // MAGE - FIRE
  Talent(id: 'm_f_criticalstrike', name: 'Critical Strike', description: 'Increases crit chance by 0.5/1/1.5/2/2.5%.', classId: 'mage', specName: 'Fire', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'm_f_firesurges', name: 'Fire Surges', description: 'Chance for spells to deal bonus fire damage.', classId: 'mage', specName: 'Fire', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'm_f_fierytemp', name: 'Fiery Temper', description: 'Chance to get Haste after fire spell.', classId: 'mage', specName: 'Fire', tier: 2, row: 1, column: 1),
  Talent(id: 'm_f_improvedfireball', name: 'Improved Fireball', description: 'Fireball damage increased.', classId: 'mage', specName: 'Fire', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'm_f_impact', name: 'Impact', description: 'Crits increase next fire spell damage.', classId: 'mage', specName: 'Fire', tier: 3, row: 1, column: 1, maxRank: 5),
  Talent(id: 'm_f_firemastery', name: 'Fire Mastery', description: 'Reduces fire damage taken.', classId: 'mage', specName: 'Fire', tier: 3, row: 2, column: 2, maxRank: 5),

  // MAGE - FROST
  Talent(id: 'm_frost_criticalstrike', name: 'Critical Strike', description: 'Increases crit chance by 0.5/1/1.5/2/2.5%.', classId: 'mage', specName: 'Frost', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'm_frost_winters Chill', name: 'Winter\'s Chill', description: 'Frost spells increase crit chance.', classId: 'mage', specName: 'Frost', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'm_frost_improvedFrostbolt', name: 'Improved Frostbolt', description: 'Frostbolt costs less mana.', classId: 'mage', specName: 'Frost', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'm_frost_barrierOfWit', name: 'Barrier of Wit', description: 'Below 35% HP: reduce damage taken.', classId: 'mage', specName: 'Frost', tier: 3, row: 1, column: 1),

  // PRIEST - DISCIPLINE
  Talent(id: 'pr_d_innerfire', name: 'Inner Fire', description: 'Increases spellpower of heals.', classId: 'priest', specName: 'Discipline', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'pr_d_mentalquick', name: 'Mental Quickness', description: 'Spell cast time reduced.', classId: 'priest', specName: 'Discipline', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'pr_d_improvedpowerword', name: 'Improved Power Word: Shield', description: 'PWS duration extended.', classId: 'priest', specName: 'Discipline', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'pr_d_improvedrenew', name: 'Improved Renew', description: 'Renew duration extended.', classId: 'priest', specName: 'Discipline', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'pr_d_desperateprayer', name: 'Desperate Prayer', description: 'Prayer: Spirit on yourself.', classId: 'priest', specName: 'Discipline', tier: 3, row: 1, column: 1),

  // DEATH KNIGHT - BLOOD
  Talent(id: 'dk_b_bloodPresence', name: 'Blood Presence', description: 'Heals deal increased damage.', classId: 'death_knight', specName: 'Blood', tier: 1, row: 1, column: 1),
  Talent(id: 'dk_b_mastery', name: 'Mastery: Blood Presence', description: 'Healing spells deal more damage.', classId: 'death_knight', specName: 'Blood', tier: 4, row: 1, column: 1),

  // SHAMAN - ELEMENTAL
  Talent(id: 's_e_maelstrom', name: 'Maelstrom Weapon', description: 'Spells generate Maelstrom stacks.', classId: 'shaman', specName: 'Elemental', tier: 1, row: 1, column: 1, maxRank: 3),
  Talent(id: 's_e_unleashedLife', name: 'Unleashed Life', description: 'Totems deal more damage, you take more.', classId: 'shaman', specName: 'Elemental', tier: 2, row: 1, column: 1),
  Talent(id: 's_e_mastery', name: 'Mastery: Lava Burst', description: 'Lava Burst costs less mana.', classId: 'shaman', specName: 'Elemental', tier: 4, row: 1, column: 1),
];
