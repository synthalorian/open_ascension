import 'package:json_annotation/json_annotation.dart';
import 'class.dart';
import 'race.dart';

part 'stats.g.dart';

/// Primary attributes that directly affect secondary stats.
@JsonSerializable()
class PrimaryStats {
  final int strength;
  final int agility;
  final int stamina;
  final int intellect;
  final int spirit;

  const PrimaryStats({
    this.strength = 0,
    this.agility = 0,
    this.stamina = 0,
    this.intellect = 0,
    this.spirit = 0,
  });

  factory PrimaryStats.fromJson(Map<String, dynamic> json) => _$PrimaryStatsFromJson(json);
  Map<String, dynamic> toJson() => _$PrimaryStatsToJson(this);

  PrimaryStats copyWith({
    int? strength,
    int? agility,
    int? stamina,
    int? intellect,
    int? spirit,
  }) => PrimaryStats(
    strength: strength ?? this.strength,
    agility: agility ?? this.agility,
    stamina: stamina ?? this.stamina,
    intellect: intellect ?? this.intellect,
    spirit: spirit ?? this.spirit,
  );

  PrimaryStats operator +(PrimaryStats other) => PrimaryStats(
    strength: strength + other.strength,
    agility: agility + other.agility,
    stamina: stamina + other.stamina,
    intellect: intellect + other.intellect,
    spirit: spirit + other.spirit,
  );
}

/// Derived secondary stats computed from primary stats, race, class, and gear.
@JsonSerializable()
class SecondaryStats {
  final int health;
  final int maxMana;
  final int armor;
  final double dodgePercent;
  final double parryPercent;
  final double blockPercent;
  final int blockValue;
  final double critPercent;
  final double hitPercent;
  final int attackPower;
  final int spellPower;
  final int healingPower;
  final double hastePercent;
  final double expertise;
  final int resilience;
  final int pvpPower;
  final double combatRatingArmorPen;
  final int manaPer5;

  const SecondaryStats({
    this.health = 0,
    this.maxMana = 0,
    this.armor = 0,
    this.dodgePercent = 0,
    this.parryPercent = 0,
    this.blockPercent = 0,
    this.blockValue = 0,
    this.critPercent = 0,
    this.hitPercent = 0,
    this.attackPower = 0,
    this.spellPower = 0,
    this.healingPower = 0,
    this.hastePercent = 0,
    this.expertise = 0,
    this.resilience = 0,
    this.pvpPower = 0,
    this.combatRatingArmorPen = 0,
    this.manaPer5 = 0,
  });

  factory SecondaryStats.fromJson(Map<String, dynamic> json) => _$SecondaryStatsFromJson(json);
  Map<String, dynamic> toJson() => _$SecondaryStatsToJson(this);
}

/// WotLK stat conversion constants per class.
class StatFormulas {
  /// Strength → Attack Power: 2 AP per Str (1 AP per Str for non-str classes, but we use unified model)
  static int apPerStr(String classId) => (classId == 'warrior' || classId == 'paladin' || classId == 'death_knight' || classId == 'shaman' || classId == 'rogue' || classId == 'hunter') ? 2 : 1;

  /// Agility → Armor: 2 Armor per Agi (varies by class armor type)
  static int armorPerAgi(String classId) {
    final cls = WarClass.findById(classId);
    if (cls == null) return 1;
    final armors = cls.armorTypes;
    if (armors.contains('Plate')) return 2;
    if (armors.contains('Mail')) return 2;
    if (armors.contains('Leather')) return 1;
    return 1;
  }

  /// Stamina → Health: 10 HP per Sta (base)
  static const int hpPerSta = 10;

  /// Intellect → Mana: 15 Mana per Int (varies by class)
  static int manaPerInt(String classId) {
    final cls = WarClass.findById(classId);
    if (cls == null) return 15;
    if (cls.role == ClassRole.caster) return 15;
    return 15;
  }

  /// Spirit → Mana regen: ~14 mp5 per Spirit at level 80 (approximate)
  static double mp5PerSpirit = 2.8;

  /// Health at level 80 base (before Sta)
  static int baseHealth = 5000;

  /// Mana at level 80 base (before Int)
  static int baseMana = 3500;

  /// Armor at level 80 base
  static int baseArmor(String classId) {
    final cls = WarClass.findById(classId);
    if (cls == null) return 0;
    final armors = cls.armorTypes;
    if (armors.contains('Plate')) return 4000;
    if (armors.contains('Mail')) return 3000;
    if (armors.contains('Leather')) return 2000;
    return 1000; // cloth
  }
}

/// Computes full character stats from primary stats, race, and class.
SecondaryStats computeSecondaryStats({
  required PrimaryStats primary,
  required String classId,
  required String? raceId,
  int gearArmor = 0,
  int gearBonusAP = 0,
  int gearBonusSpellPower = 0,
  int gearBonusCrit = 0,
  int gearBonusHaste = 0,
  int gearBonusResilience = 0,
}) {
  final apPerStr = StatFormulas.apPerStr(classId);
  final armorPerAgi = StatFormulas.armorPerAgi(classId);
  final hpPerSta = StatFormulas.hpPerSta;
  final manaPerInt = StatFormulas.manaPerInt(classId);
  final mp5PerSpirit = StatFormulas.mp5PerSpirit;

  // Racial bonuses
  final race = raceId != null ? Race.findById(raceId) : null;
  int racialAP = 0;
  int racialSpellPower = 0;
  double racialCritBonus = 0;

  if (race != null) {
    switch (race.id) {
      case 'human':
        racialCritBonus += 1; // The Human Spirit
        break;
      case 'orc': racialAP += 5; break;
      case 'dwarf': break;
      case 'night_elf': racialCritBonus += 1; break;
      case 'gnome': break;
      case 'draenei': break;
      case 'worgen': racialCritBonus += 1; break;
      case 'forsaken': break;
      case 'tauren': break;
      case 'blood_elf': racialSpellPower += 15; break;
      case 'goblin': break;
    }
  }

  // Class-specific AP from Agi (hunters & rogues get 1 AP per Agi)
  int agiAP = 0;
  if (classId == 'hunter' || classId == 'rogue') {
    agiAP = primary.agility;
  }

  // Compute secondary stats
  final health = StatFormulas.baseHealth + (primary.stamina * hpPerSta);
  final maxMana = StatFormulas.baseMana + (primary.intellect * manaPerInt);
  final totalArmor = gearArmor + StatFormulas.baseArmor(classId) + (primary.agility * armorPerAgi);

  final totalAP = (primary.strength * apPerStr) + agiAP + racialAP + gearBonusAP;
  final totalSpellPower = racialSpellPower + gearBonusSpellPower;
  final totalHealing = totalSpellPower + (primary.spirit ~/ 2);

  // Crit: base 5% + str/crit bonuses + gear
  double baseCrit = 5.0;
  final totalCrit = baseCrit + racialCritBonus + (gearBonusCrit / 100.0);

  // Hit: base 0% + gear
  final hitPercent = 8.0 + (gearBonusHaste / 100.0); // 8% hit cap at level 80

  // Dodge from agility: ~0.04% dodge per Agi at level 80
  final dodgePercent = primary.agility * 0.04;

  // Parry: Warriors/Paladins/DKs get parry
  double parryPercent = 0;
  if (classId == 'warrior' || classId == 'paladin' || classId == 'death_knight') {
    parryPercent = 5.0 + (primary.strength * 0.25 / 100.0);
  }

  // Block: Plate classes
  int blockValue = (primary.strength ~/ 5);
  double blockPercent = (classId == 'warrior' || classId == 'paladin') ? 60 : 0;

  // Haste: base 0% + gear
  final hastePercent = gearBonusHaste / 100.0;

  // Expertise
  final expertise = (primary.agility * 0.25 / 4.0);

  // Mana regen
  final manaPer5 = (primary.spirit * mp5PerSpirit).toInt();

  // PvP
  final resilience = gearBonusResilience;
  final pvpPower = resilience ~/ 2;

  return SecondaryStats(
    health: health,
    maxMana: maxMana,
    armor: totalArmor,
    dodgePercent: double.parse(dodgePercent.toStringAsFixed(2)),
    parryPercent: double.parse(parryPercent.toStringAsFixed(2)),
    blockPercent: blockPercent,
    blockValue: blockValue,
    critPercent: double.parse(totalCrit.toStringAsFixed(2)),
    hitPercent: double.parse(hitPercent.toStringAsFixed(2)),
    attackPower: totalAP,
    spellPower: totalSpellPower,
    healingPower: totalHealing,
    hastePercent: double.parse(hastePercent.toStringAsFixed(2)),
    expertise: double.parse(expertise.toStringAsFixed(2)),
    resilience: resilience,
    pvpPower: pvpPower,
    manaPer5: manaPer5,
  );
}

// Default starting stats per class at level 1 (scaled for WotLK level 80 baseline)
Map<String, PrimaryStats> defaultClassStats = {
  'warrior': const PrimaryStats(strength: 100, agility: 70, stamina: 120, intellect: 30, spirit: 20),
  'paladin': const PrimaryStats(strength: 90, agility: 50, stamina: 110, intellect: 60, spirit: 40),
  'hunter': const PrimaryStats(strength: 60, agility: 120, stamina: 90, intellect: 40, spirit: 30),
  'rogue': const PrimaryStats(strength: 70, agility: 130, stamina: 70, intellect: 20, spirit: 25),
  'priest': const PrimaryStats(strength: 20, agility: 30, stamina: 70, intellect: 120, spirit: 100),
  'death_knight': const PrimaryStats(strength: 110, agility: 60, stamina: 115, intellect: 40, spirit: 30),
  'shaman': const PrimaryStats(strength: 70, agility: 60, stamina: 90, intellect: 100, spirit: 70),
  'mage': const PrimaryStats(strength: 25, agility: 30, stamina: 65, intellect: 130, spirit: 65),
  'warlock': const PrimaryStats(strength: 30, agility: 35, stamina: 75, intellect: 115, spirit: 70),
};

// Stat distribution points available per class/race combo
int getStatPointsForClass(String classId, String? raceId) {
  int base = 70; // Base points
  // Race modifies
  if (raceId != null) {
    switch (raceId) {
      case 'orc': case 'human': case 'tauren': case 'dwarf':
        base += 5; // Strength/stamina bonuses
        break;
      case 'night_elf': case 'blood_elf': case 'gnome':
        base += 3; // Intellect/spirit bonuses
        break;
    }
  }
  // Class modifies
  switch (classId) {
    case 'warrior': case 'paladin': case 'death_knight':
      return base + 10; // Melee-focused get more
    case 'mage': case 'priest': case 'warlock':
      return base + 5; // Casters get moderate
    default:
      return base;
  }
}
