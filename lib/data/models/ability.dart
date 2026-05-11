import 'package:json_annotation/json_annotation.dart';

part 'ability.g.dart';

enum DamageSchool {
  physical('Physical'),
  holy('Holy'),
  nature('Nature'),
  fire('Fire'),
  frost('Frost'),
  shadow('Shadow'),
  arcane('Arcane');

  const DamageSchool(this.displayName);
  final String displayName;
}

@JsonSerializable()
class Ability {
  final String id;
  final String name;
  final String description;
  final String classId;
  final DamageSchool school;
  final int minLevel;
  final double? manaCost;
  final double? cooldown;
  final String? icon;
  final bool isPassive;
  final bool isClassless;

  const Ability({
    required this.id,
    required this.name,
    required this.description,
    required this.classId,
    required this.school,
    required this.minLevel,
    this.manaCost,
    this.cooldown,
    this.icon,
    this.isPassive = false,
    this.isClassless = true,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

const sampleAbilities = <Ability>[
  // WARRIOR
  Ability(id: 'w_meleesweep', name: 'Melee Sweep', description: 'Sweep enemies around you.', classId: 'warrior', school: DamageSchool.physical, minLevel: 1, isPassive: true),
  Ability(id: 'w_heroicstrike', name: 'Heroic Strike', description: 'Strike an enemy for significant damage.', classId: 'warrior', school: DamageSchool.physical, minLevel: 2, cooldown: 3),
  Ability(id: 'w_whirlwind', name: 'Whirlwind', description: 'Swing weapon in a circle.', classId: 'warrior', school: DamageSchool.physical, minLevel: 4, cooldown: 6),
  Ability(id: 'w_slam', name: 'Slam', description: 'A devastating hammer blow.', classId: 'warrior', school: DamageSchool.physical, minLevel: 10, cooldown: 10),
  Ability(id: 'w_battlestance', name: 'Battle Stance', description: 'Increases crit chance.', classId: 'warrior', school: DamageSchool.physical, minLevel: 1, isPassive: true),
  Ability(id: 'w_defensivestance', name: 'Defensive Stance', description: 'Reduces damage taken.', classId: 'warrior', school: DamageSchool.physical, minLevel: 6, isPassive: true),
  Ability(id: 'w_berserkerstance', name: 'Berserker Stance', description: 'Increases damage at cost of armor.', classId: 'warrior', school: DamageSchool.physical, minLevel: 14, isPassive: true),
  Ability(id: 'w_intimidatingshout', name: 'Intimidating Shout', description: 'Fear nearby enemies for 8s.', classId: 'warrior', school: DamageSchool.physical, minLevel: 8, cooldown: 60),
  Ability(id: 'w_battlecharge', name: 'Battle Charge', description: 'Charge to an enemy.', classId: 'warrior', school: DamageSchool.physical, minLevel: 42, cooldown: 45),
  Ability(id: 'w_mortalstrike', name: 'Mortal Strike', description: 'Devastating strike reducing healing.', classId: 'warrior', school: DamageSchool.physical, minLevel: 32, cooldown: 6),
  Ability(id: 'w_sweepingblows', name: 'Sweeping Blows', description: 'Melee attacks hit all in front.', classId: 'warrior', school: DamageSchool.physical, minLevel: 8, cooldown: 0, isPassive: true),
  Ability(id: 'w_bloodthirst', name: 'Bloodthirst', description: 'Powerful attack that heals you.', classId: 'warrior', school: DamageSchool.physical, minLevel: 16),
  Ability(id: 'w_recklessness', name: 'Recklessness', description: 'Increase damage and crit for 15s.', classId: 'warrior', school: DamageSchool.physical, minLevel: 48, cooldown: 180),
  Ability(id: 'w_laststand', name: 'Last Stand', description: 'Double max health for 10s.', classId: 'warrior', school: DamageSchool.physical, minLevel: 36, cooldown: 600),
  Ability(id: 'w_enslavingshadow', name: 'Enslaving Shadow', description: 'Kill target, gain its mana.', classId: 'warrior', school: DamageSchool.physical, minLevel: 58, cooldown: 600),
  Ability(id: 'w_improvedcharging', name: 'Improved Charging', description: 'Charges cost less rage.', classId: 'warrior', school: DamageSchool.physical, minLevel: 28, isPassive: true),
  Ability(id: 'w_sanctuary', name: 'Sanctuary', description: 'Immune to damage for 4s, lose threat.', classId: 'warrior', school: DamageSchool.physical, minLevel: 50, cooldown: 600),
  Ability(id: 'w_juggernaut', name: 'Juggernaut', description: 'Stance lasts 33% longer.', classId: 'warrior', school: DamageSchool.physical, minLevel: 60, isPassive: true),
  Ability(id: 'w_ignorepain', name: 'Ignore Pain', description: 'Convert healing to rage.', classId: 'warrior', school: DamageSchool.physical, minLevel: 18, isPassive: true),
  Ability(id: 'w_defensivedesign', name: 'Defensive Design', description: 'Shield block chance generates rage.', classId: 'warrior', school: DamageSchool.physical, minLevel: 22, isPassive: true),

  // PALADIN
  Ability(id: 'p_righteousdefense', name: 'Righteous Defense', description: 'Draw threat from an ally.', classId: 'paladin', school: DamageSchool.holy, minLevel: 10, cooldown: 45),
  Ability(id: 'p_sealofrighteousness', name: 'Seal of Righteousness', description: 'Melee attacks deal holy damage + threat.', classId: 'paladin', school: DamageSchool.holy, minLevel: 16, isPassive: true),
  Ability(id: 'p_sealofcommand', name: 'Seal of Command', description: 'Heroic Strike deals bonus damage.', classId: 'paladin', school: DamageSchool.holy, minLevel: 40, isPassive: true),
  Ability(id: 'p_hammerofwrath', name: 'Hammer of Wrath', description: 'Execute low-health enemies.', classId: 'paladin', school: DamageSchool.holy, minLevel: 30),
  Ability(id: 'p_holyshield', name: 'Holy Shield', description: 'Reduces physical damage.', classId: 'paladin', school: DamageSchool.holy, minLevel: 42, isPassive: true),
  Ability(id: 'p_divineshield', name: 'Divine Shield', description: 'Immune to damage for 10s.', classId: 'paladin', school: DamageSchool.holy, minLevel: 20, cooldown: 300),
  Ability(id: 'p_devotionaura', name: 'Devotion Aura', description: 'Increases armor of party.', classId: 'paladin', school: DamageSchool.holy, minLevel: 6, isPassive: true),
  Ability(id: 'p_retributionaura', name: 'Retribution Aura', description: 'Attackers take holy damage.', classId: 'paladin', school: DamageSchool.holy, minLevel: 16, isPassive: true),
  Ability(id: 'p_consecration', name: 'Consecration', description: 'Hallow an area, damaging enemies.', classId: 'paladin', school: DamageSchool.holy, minLevel: 26),
  Ability(id: 'p_holywrath', name: 'Holy Wrath', description: 'Stun undead and demons.', classId: 'paladin', school: DamageSchool.holy, minLevel: 20, cooldown: 180),
  Ability(id: 'p_holyshield2', name: 'Hammer of the Righteous', description: 'Powerful AoE holy melee attack.', classId: 'paladin', school: DamageSchool.holy, minLevel: 58),
  Ability(id: 'p_divinepurpose', name: 'Divine Purpose', description: 'Heals generate Holy Power.', classId: 'paladin', school: DamageSchool.holy, minLevel: 64, isPassive: true),
  Ability(id: 'p_ardentdefender', name: 'Ardent Defender', description: 'Heal yourself when below 30% HP.', classId: 'paladin', school: DamageSchool.holy, minLevel: 50),
  Ability(id: 'p_handsOfAgility', name: 'Hands of Agility', description: 'Increase party dodge for 30s.', classId: 'paladin', school: DamageSchool.holy, minLevel: 38, cooldown: 600),
  Ability(id: 'p_handsOfProtection', name: 'Hands of Protection', description: 'Immune to physical damage for 10s.', classId: 'paladin', school: DamageSchool.holy, minLevel: 28, cooldown: 300),
  Ability(id: 'p_layOnHands', name: 'Lay on Hands', description: 'Instantly heal target for large amount.', classId: 'paladin', school: DamageSchool.holy, minLevel: 6, cooldown: 10800),
  Ability(id: 'p_wordOfGlory', name: 'Word of Glory', description: 'Powerful heal based on missing health.', classId: 'paladin', school: DamageSchool.holy, minLevel: 60),
  Ability(id: 'p_judgement', name: 'Judgement', description: 'Judgement of your active seal.', classId: 'paladin', school: DamageSchool.holy, minLevel: 10),
  Ability(id: 'p_hammerOfJustice', name: 'Hammer of Justice', description: 'Stun an enemy for 6s.', classId: 'paladin', school: DamageSchool.holy, minLevel: 4, cooldown: 45),
  Ability(id: 'p_turnUndead', name: 'Turn Undead', description: 'Fear undead enemies.', classId: 'paladin', school: DamageSchool.holy, minLevel: 1, cooldown: 0, isPassive: true),

  // HUNTER
  Ability(id: 'h_rapidshot', name: 'Rapid Shot', description: 'Ranged attacks restore energy.', classId: 'hunter', school: DamageSchool.physical, minLevel: 1, isPassive: true),
  Ability(id: 'h_aimedshot', name: 'Aimed Shot', description: 'Devastating arrow/missile.', classId: 'hunter', school: DamageSchool.physical, minLevel: 4),
  Ability(id: 'h_concussive', name: 'Concussive Shot', description: 'Slow an enemy.', classId: 'hunter', school: DamageSchool.physical, minLevel: 10, cooldown: 8),
  Ability(id: 'h_wingshot', name: 'Wing Clip', description: 'Reduce movement speed.', classId: 'hunter', school: DamageSchool.physical, minLevel: 24),
  Ability(id: 'h_freezingtraps', name: 'Freezing Trap', description: 'Freeze enemies in an area.', classId: 'hunter', school: DamageSchool.frost, minLevel: 10, cooldown: 60),
  Ability(id: 'h_disengage', name: 'Disengage', description: 'Teleport 15-25 yards.', classId: 'hunter', school: DamageSchool.physical, minLevel: 2, cooldown: 45),
  Ability(id: 'h_feint', name: 'Feint', description: 'Reduce threat generated.', classId: 'hunter', school: DamageSchool.physical, minLevel: 30, cooldown: 45),
  Ability(id: 'h_beastialswiftness', name: 'Beastial Swiftness', description: 'Pet moves faster.', classId: 'hunter', school: DamageSchool.nature, minLevel: 46, isPassive: true),
  Ability(id: 'h_pet', name: 'Call Pet', description: 'Summon your trained pet.', classId: 'hunter', school: DamageSchool.nature, minLevel: 10, cooldown: 0),
  Ability(id: 'h_beastialdiscipline', name: 'Beastial Discipline', description: 'Pet generates focus for you.', classId: 'hunter', school: DamageSchool.nature, minLevel: 34, isPassive: true),
  Ability(id: 'h_aspectOfTheWild', name: 'Aspect of the Wild', description: 'Increase armor and pet armor.', classId: 'hunter', school: DamageSchool.nature, minLevel: 40),
  Ability(id: 'h_silentHunter', name: 'Silent Hunter', description: 'Shots generate more focus.', classId: 'hunter', school: DamageSchool.physical, minLevel: 52),
  Ability(id: 'h_tricksOfTrade', name: 'Tricks of the Trade', description: 'Transfer pet focus to you.', classId: 'hunter', school: DamageSchool.nature, minLevel: 64),
  Ability(id: 'h_mastersCall', name: "Master's Call", description: 'Recall pet and reduce its cooldown.', classId: 'hunter', school: DamageSchool.nature, minLevel: 70),
  Ability(id: 'h_readBeast', name: 'Read Beast', description: 'See pet stats and traits.', classId: 'hunter', school: DamageSchool.nature, minLevel: 10, cooldown: 0),
  Ability(id: 'h_traps', name: 'Trap Mastery', description: 'Improve all traps.', classId: 'hunter', school: DamageSchool.physical, minLevel: 38),

  // ROGUE
  Ability(id: 'r_eviscerate', name: 'Eviscerate', description: 'Devastating finishing move.', classId: 'rogue', school: DamageSchool.physical, minLevel: 6),
  Ability(id: 'r_sprint', name: 'Sprint', description: 'Increase movement speed 45%.', classId: 'rogue', school: DamageSchool.physical, minLevel: 12, cooldown: 300),
  Ability(id: 'r_ambush', name: 'Ambush', description: 'Stealthed attack with bonus combo points.', classId: 'rogue', school: DamageSchool.physical, minLevel: 26, cooldown: 45),
  Ability(id: 'r_deadlypoisons', name: 'Deadly Poisons', description: 'Poisons apply to all attacks.', classId: 'rogue', school: DamageSchool.physical, minLevel: 40, isPassive: true),
  Ability(id: 'r_stealth', name: 'Stealth', description: 'Become invisible.', classId: 'rogue', school: DamageSchool.physical, minLevel: 1),
  Ability(id: 'r_vanish', name: 'Vanish', description: 'Enhanced stealth that breaks combat.', classId: 'rogue', school: DamageSchool.physical, minLevel: 40, cooldown: 300),
  Ability(id: 'r_daggerMastery', name: 'Dagger Mastery', description: 'Dagger damage increased.', classId: 'rogue', school: DamageSchool.physical, minLevel: 14, isPassive: true),
  Ability(id: 'r_deadlyBrew', name: 'Deadly Brew', description: 'Increase attack power temporarily.', classId: 'rogue', school: DamageSchool.physical, minLevel: 54, cooldown: 180),
  Ability(id: 'r_bloodstaining', name: 'Bloodstain', description: 'Attacks heal you.', classId: 'rogue', school: DamageSchool.physical, minLevel: 48),
  Ability(id: 'r_trickShadows', name: 'Tricks of the Shadow', description: 'Stealthed attacks deal more damage.', classId: 'rogue', school: DamageSchool.physical, minLevel: 60),
  Ability(id: 'r_justicar', name: "Justicar's Might", description: 'Increase attack power for party.', classId: 'rogue', school: DamageSchool.physical, minLevel: 68),
  Ability(id: 'r_coupdegrace', name: 'Coup de Grace', description: 'Massive finishing move.', classId: 'rogue', school: DamageSchool.physical, minLevel: 58),
  Ability(id: 'r_butchery', name: 'Butchery', description: 'Execute low-health enemies.', classId: 'rogue', school: DamageSchool.physical, minLevel: 50),
  Ability(id: 'r_sunderArmor', name: 'Sunder Armor', description: 'Reduce target armor.', classId: 'rogue', school: DamageSchool.physical, minLevel: 20),
  Ability(id: 'r_rupture', name: 'Rupture', description: 'Powerful AoE finishing move.', classId: 'rogue', school: DamageSchool.physical, minLevel: 42),

  // PRIEST
  Ability(id: 'pr_heal', name: 'Heal', description: 'Restore health to an ally.', classId: 'priest', school: DamageSchool.holy, minLevel: 1),
  Ability(id: 'pr_innerfire', name: 'Inner Fire', description: 'Increase healing spellpower.', classId: 'priest', school: DamageSchool.holy, minLevel: 12, isPassive: true),
  Ability(id: 'pr_shadowwordpain', name: 'Shadow Word: Pain', description: 'DoT dealing shadow damage.', classId: 'priest', school: DamageSchool.shadow, minLevel: 6),
  Ability(id: 'pr_psychicscream', name: 'Psychic Scream', description: 'Fear enemies in an area.', classId: 'priest', school: DamageSchool.arcane, minLevel: 20, cooldown: 120),
  Ability(id: 'pr_dispellmagic', name: 'Dispel Magic', description: 'Remove a magic effect.', classId: 'priest', school: DamageSchool.holy, minLevel: 10, cooldown: 15),
  Ability(id: 'pr_powerwordshield', name: 'Power Word: Shield', description: 'Absorb damage for an ally.', classId: 'priest', school: DamageSchool.holy, minLevel: 16),
  Ability(id: 'pr_shadowfiend', name: 'Shadowfiend', description: 'Summon a shadow demon.', classId: 'priest', school: DamageSchool.shadow, minLevel: 46, cooldown: 600),
  Ability(id: 'pr_renew', name: 'Renew', description: 'Heal over time.', classId: 'priest', school: DamageSchool.holy, minLevel: 14),
  Ability(id: 'pr_flashheal', name: 'Flash Heal', description: 'Quick heal.', classId: 'priest', school: DamageSchool.holy, minLevel: 4),
  Ability(id: 'pr_bindingheal', name: 'Binding Heal', description: 'Heal while root.', classId: 'priest', school: DamageSchool.holy, minLevel: 22),
  Ability(id: 'pr_desperateprayer', name: 'Desperate Prayer', description: 'Heal yourself.', classId: 'priest', school: DamageSchool.holy, minLevel: 60),
  Ability(id: 'pr_purge', name: 'Purge', description: 'Remove buff, disarm/deflect.', classId: 'priest', school: DamageSchool.holy, minLevel: 26, cooldown: 20),
  Ability(id: 'pr_glibness', name: 'Glibness', description: 'Chance to immune to CC.', classId: 'priest', school: DamageSchool.holy, minLevel: 48, isPassive: true),
  Ability(id: 'pr_vampiricTouch', name: 'Vampiric Touch', description: 'Powerful DoT that heals you.', classId: 'priest', school: DamageSchool.shadow, minLevel: 58),
  Ability(id: 'pr_silence', name: 'Silence', description: 'Prevent casting.', classId: 'priest', school: DamageSchool.holy, minLevel: 18, cooldown: 30),
  Ability(id: 'pr_divinefury', name: 'Divine Fury', description: 'Increase crit of next spell.', classId: 'priest', school: DamageSchool.holy, minLevel: 50, cooldown: 30),
  Ability(id: 'pr_wordsOfFlight', name: 'Word of Flight', description: 'Increase movement speed.', classId: 'priest', school: DamageSchool.holy, minLevel: 32),
  Ability(id: 'pr_mindSpike', name: 'Mind Spike', description: 'Instant shadow damage.', classId: 'priest', school: DamageSchool.shadow, minLevel: 68),
  Ability(id: 'pr_powerInfusion', name: 'Power Infusion', description: 'Increase power of target.', classId: 'priest', school: DamageSchool.holy, minLevel: 42, cooldown: 300),

  // DEATH KNIGHT
  Ability(id: 'dk_deathanddecay', name: 'Death and Decay', description: 'AoE damage and slow.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 42, cooldown: 30),
  Ability(id: 'dk_iceboundfortitude', name: 'Ice Bound Fortitude', description: 'Immune briefly.', classId: 'death_knight', school: DamageSchool.frost, minLevel: 44, cooldown: 120),
  Ability(id: 'dk_antimagiczone', name: 'Anti-Magic Zone', description: 'Reduce magic damage for party.', classId: 'death_knight', school: DamageSchool.arcane, minLevel: 48, cooldown: 45),
  Ability(id: 'dk_empower', name: 'Empower Rune Weapon', description: 'Refill runes instantly.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 54, cooldown: 300),
  Ability(id: 'dk_deathgrip', name: 'Death Grip', description: 'Grab an enemy.', classId: 'death_knight', school: DamageSchool.frost, minLevel: 2, cooldown: 20),
  Ability(id: 'dk_outbreak', name: 'Outbreak', description: 'Spread plague to multiple targets.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 62, cooldown: 45),
  Ability(id: 'dk_darkTransformation', name: 'Dark Transformation', description: 'Turn corpse into death knight.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 68, cooldown: 3600),
  Ability(id: 'dk_plagueStrike', name: 'Plague Strike', description: 'Melee attack applying disease.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 6),
  Ability(id: 'dk_frostStrike', name: 'Frost Strike', description: 'Melee attack dealing frost damage.', classId: 'death_knight', school: DamageSchool.frost, minLevel: 16),
  Ability(id: 'dk_icyTalons', name: 'Icy Talons', description: 'Reduce rune cost of Frost Strike.', classId: 'death_knight', school: DamageSchool.frost, minLevel: 20),
  Ability(id: 'dk_hornOfWinter', name: 'Horn of Winter', description: 'Heal party and increase armor.', classId: 'death_knight', school: DamageSchool.frost, minLevel: 50, cooldown: 180),
  Ability(id: 'dk_deadlyPlague', name: 'Deadly Plague', description: 'Powerful DoT.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 56),
  Ability(id: 'dk_callOfAvarice', name: 'Call of Avarice', description: 'Summon spirits that deal damage.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 64, cooldown: 45),
  Ability(id: 'dk_titanGrip', name: 'Titan Grip', description: 'Wield 2H weapons in each hand.', classId: 'death_knight', school: DamageSchool.physical, minLevel: 58),
  Ability(id: 'dk_unholyBlight', name: 'Unholy Blight', description: 'AoE plague damage.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 40),
  Ability(id: 'dk_pestilence', name: 'Pestilence', description: 'Spread diseases to enemies.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 34),
  Ability(id: 'dk_bloodPlague', name: 'Blood Plague', description: 'DoT increasing bleed damage.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 12),
  Ability(id: 'dk_bloodBoil', name: 'Blood Boil', description: 'AoE damage to diseased targets.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 26),
  Ability(id: 'dk_runempth', name: 'Rune Poaching', description: 'Steal runes from rune corpses.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 38),
  Ability(id: 'dk_summonGhoul', name: 'Summon Ghoul', description: 'Summon an undead pet.', classId: 'death_knight', school: DamageSchool.shadow, minLevel: 30, cooldown: 600),

  // SHAMAN
  Ability(id: 's_earthshock', name: 'Earth Shock', description: 'Stun and deal nature damage.', classId: 'shaman', school: DamageSchool.nature, minLevel: 2),
  Ability(id: 's_flameshock', name: 'Flame Shock', description: 'DoT enabling Maelstorm.', classId: 'shaman', school: DamageSchool.fire, minLevel: 10),
  Ability(id: 's_chainlightning', name: 'Chain Lightning', description: 'Lightning that jumps between enemies.', classId: 'shaman', school: DamageSchool.nature, minLevel: 30),
  Ability(id: 's_earthshield', name: 'Earth Shield', description: 'Heals an ally over time.', classId: 'shaman', school: DamageSchool.nature, minLevel: 32, isPassive: true),
  Ability(id: 's_healingstreamtotem', name: 'Healing Stream Totem', description: 'Periodically heals nearby allies.', classId: 'shaman', school: DamageSchool.nature, minLevel: 36),
  Ability(id: 's_hex', name: 'Hex', description: 'Turn an enemy into a frog.', classId: 'shaman', school: DamageSchool.nature, minLevel: 44),
  Ability(id: 's_stormstrike', name: 'Stormstrike', description: 'Powerful melee strike.', classId: 'shaman', school: DamageSchool.nature, minLevel: 16),
  Ability(id: 's_lightningbolt', name: 'Lightning Bolt', description: 'Deal nature damage.', classId: 'shaman', school: DamageSchool.nature, minLevel: 10),
  Ability(id: 's_healingwave', name: 'Healing Wave', description: 'Heal an ally.', classId: 'shaman', school: DamageSchool.nature, minLevel: 4),
  Ability(id: 's_lesserHealingWave', name: 'Lesser Healing Wave', description: 'Quick heal.', classId: 'shaman', school: DamageSchool.nature, minLevel: 2),
  Ability(id: 's_totemOfLifeGiving', name: 'Totem of Life Giving', description: 'Heals nearby party members.', classId: 'shaman', school: DamageSchool.nature, minLevel: 6),
  Ability(id: 's_stoneSkinTotem', name: 'Stone Skin Totem', description: 'Increases armor.', classId: 'shaman', school: DamageSchool.nature, minLevel: 14),
  Ability(id: 's_strengthOfEarthTotem', name: 'Strength of Earth Totem', description: 'Increases strength.', classId: 'shaman', school: DamageSchool.nature, minLevel: 16),
  Ability(id: 's_fireNovaTotem', name: 'Fire Nova Totem', description: 'Exploding fire totem.', classId: 'shaman', school: DamageSchool.fire, minLevel: 22),
  Ability(id: 's_flametotem', name: 'Flame Totem', description: 'Deal fire damage to nearby enemies.', classId: 'shaman', school: DamageSchool.fire, minLevel: 24),
  Ability(id: 's_feralSpirit', name: 'Feral Spirit', description: 'Summon wolf spirits.', classId: 'shaman', school: DamageSchool.nature, minLevel: 58, cooldown: 45),
  Ability(id: 's_lavaBurst', name: 'Lava Burst', description: 'Instant fire damage on Flame Shock targets.', classId: 'shaman', school: DamageSchool.fire, minLevel: 62),
  Ability(id: 's_ancestralSpirit', name: 'Ancestral Spirit', description: 'Resurrect nearby dead allies.', classId: 'shaman', school: DamageSchool.nature, minLevel: 52, cooldown: 600),
  Ability(id: 's_magmaTotem', name: 'Magma Totem', description: 'Powerful AoE fire totem.', classId: 'shaman', school: DamageSchool.fire, minLevel: 66),
  Ability(id: 's_lavaLance', name: 'Lava Lance', description: 'Instant fire damage.', classId: 'shaman', school: DamageSchool.fire, minLevel: 68),

  // WARLOCK
  Ability(id: 'wl_corruption', name: 'Corruption', description: 'DoT dealing shadow damage.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 1),
  Ability(id: 'wl_drainlife', name: 'Drain Life', description: 'Drain health to heal yourself.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 16),
  Ability(id: 'wl_lifeblood', name: 'Lifeblood', description: 'Reduce target healing received.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 22, cooldown: 300),
  Ability(id: 'wl_runeOfDoom', name: 'Rune of Doom', description: 'Curse that can critically fail.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 50, cooldown: 600),
  Ability(id: 'wl_demonicembrace', name: 'Demonic Embrace', description: 'Trade armor for spellpower.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 68, isPassive: true),
  Ability(id: 'wl_shadowburn', name: 'Shadowburn', description: 'Execute shadow-damaged enemies.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 10),
  Ability(id: 'wl_healthstone', name: 'Healthstone', description: 'Create a health stone.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 16),
  Ability(id: 'wl_curseOfWeakness', name: 'Curse of Weakness', description: 'Reduce attack power.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 10),
  Ability(id: 'wl_curseOfExhaustion', name: 'Curse of Exhaustion', description: 'Reduce movement speed.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 20),
  Ability(id: 'wl_shadowbolt', name: 'Shadow Bolt', description: 'Deal shadow damage.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 8),
  Ability(id: 'wl_conflagrate', name: 'Conflagrate', description: 'Instant damage on DoT targets.', classId: 'warlock', school: DamageSchool.fire, minLevel: 32),
  Ability(id: 'wl_immolate', name: 'Immolate', description: 'DoT dealing fire damage.', classId: 'warlock', school: DamageSchool.fire, minLevel: 26),
  Ability(id: 'wl_deathcoil', name: 'Death Coil', description: 'Damage enemies or heal allies.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 40, cooldown: 60),
  Ability(id: 'wl_soulstone', name: 'Soulstone', description: 'Resurrect target without running.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 42, cooldown: 300),
  Ability(id: 'wl_runePenetrate', name: 'Rune Penetration', description: 'Curse reducing spell resistance.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 54),
  Ability(id: 'wl_summonDread', name: 'Summon Dreadlord', description: 'Summon powerful demon.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 50, cooldown: 600),
  Ability(id: 'wl_ritualOfRuin', name: 'Ritual of Ruin', description: 'Channel to deal massive shadow damage.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 60),
  Ability(id: 'wl_masteryDemology', name: 'Mastery: Demonic Tactics', description: 'Demons deal increased damage.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 58),
  Ability(id: 'wl_handOfGrimmal', name: 'Hand of Grimmal', description: 'Increase demon damage.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 64),
  Ability(id: 'wl_masterySoul', name: 'Mastery: Siphon Soul', description: 'Killing with DoTs gives soul shards.', classId: 'warlock', school: DamageSchool.shadow, minLevel: 66),

  // MAGE
  Ability(id: 'm_fireblast', name: 'Fire Blast', description: 'Quick fire damage.', classId: 'mage', school: DamageSchool.fire, minLevel: 1),
  Ability(id: 'm_conjurefood', name: 'Conjure Refreshing Mint', description: 'Create food.', classId: 'mage', school: DamageSchool.arcane, minLevel: 20, cooldown: 3600),
  Ability(id: 'm_firesurges', name: 'Fire Surges', description: 'Chance to increase fire damage.', classId: 'mage', school: DamageSchool.fire, minLevel: 14, isPassive: true),
  Ability(id: 'm_blizzard', name: 'Blizzard', description: 'Massive AoE frost damage and slow.', classId: 'mage', school: DamageSchool.frost, minLevel: 36),
  Ability(id: 'm_icynve', name: 'Icy Veins', description: 'Increase spellpower and cast speed.', classId: 'mage', school: DamageSchool.frost, minLevel: 62, cooldown: 300),
  Ability(id: 'm_invisibility', name: 'Invisibility', description: 'Become invisible (peacetime).', classId: 'mage', school: DamageSchool.arcane, minLevel: 30, cooldown: 300),
  Ability(id: 'm_ward', name: 'Arcane Ward', description: 'Create an arcane shield.', classId: 'mage', school: DamageSchool.arcane, minLevel: 10, cooldown: 300),
  Ability(id: 'm_fireball', name: 'Fireball', description: 'Deal fire damage.', classId: 'mage', school: DamageSchool.fire, minLevel: 4),
  Ability(id: 'm_frostbolt', name: 'Frostbolt', description: 'Deal frost damage.', classId: 'mage', school: DamageSchool.frost, minLevel: 2),
  Ability(id: 'm_arcaneMissile', name: 'Arcane Missiles', description: 'Deal arcane damage.', classId: 'mage', school: DamageSchool.arcane, minLevel: 10),
  Ability(id: 'm_polymorph', name: 'Polymorph', description: 'Turn target into a sheep.', classId: 'mage', school: DamageSchool.arcane, minLevel: 6, cooldown: 0),
  Ability(id: 'm_blink', name: 'Blink', description: 'Teleport a short distance.', classId: 'mage', school: DamageSchool.arcane, minLevel: 26, cooldown: 15),
  Ability(id: 'm_frozen', name: 'Frozen Armor', description: 'Armor that absorbs damage.', classId: 'mage', school: DamageSchool.frost, minLevel: 12),
  Ability(id: 'm_conjureMana', name: 'Conjure Mana Gem', description: 'Create a mana gem.', classId: 'mage', school: DamageSchool.arcane, minLevel: 16, cooldown: 0),
  Ability(id: 'm_counterspell', name: 'Counterspell', description: 'Interrupt and silence target.', classId: 'mage', school: DamageSchool.arcane, minLevel: 18, cooldown: 24),
  Ability(id: 'm_frostFire', name: 'Frostfire Bolt', description: 'Deal frost and fire damage.', classId: 'mage', school: DamageSchool.frost, minLevel: 52),
  Ability(id: 'm_livingBomb', name: 'Living Bomb', description: 'AoE fire DoT.', classId: 'mage', school: DamageSchool.fire, minLevel: 50),
  Ability(id: 'm_mayor', name: 'Netherswimmer', description: 'Travel underwater.', classId: 'mage', school: DamageSchool.arcane, minLevel: 60, cooldown: 300),
  Ability(id: 'm_deepFreeze', name: 'Deep Freeze', description: 'Freeze target in ice.', classId: 'mage', school: DamageSchool.frost, minLevel: 64),
  Ability(id: 'm_mastery', name: 'Mastery: Barrier of Wit', description: 'Below 35% HP: reduce damage, gain spellpower.', classId: 'mage', school: DamageSchool.arcane, minLevel: 58, isPassive: true),
  Ability(id: 'm_barrierOfWit', name: 'Barriers to Knowledge', description: 'Below 25% HP: immune to CC.', classId: 'mage', school: DamageSchool.arcane, minLevel: 66),
];
