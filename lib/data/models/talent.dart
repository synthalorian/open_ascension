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

// All WotLK talents for OG 9 Classes
const sampleTalents = <Talent>[

  // ============================================================
  // WARRIOR
  // ============================================================

  // --- Arms ---
  Talent(id: 'w_a_tough', name: 'Toughness', description: 'Increases armor value from items by 2/4/6/8/10%.', classId: 'warrior', specName: 'Arms', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_a_imp_overpower', name: 'Improved Overpower', description: 'Increases the damage dealt by your Overpower ability by 25/50%.', classId: 'warrior', specName: 'Arms', tier: 1, row: 2, column: 2, maxRank: 2),
  Talent(id: 'w_a_twohand', name: 'Two-Handed Weapon Spec', description: 'Increases the damage you deal with two-handed melee weapons by 1/2/3/4/5%.', classId: 'warrior', specName: 'Arms', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'w_a_imp_thunderclap', name: 'Improved Thunder Clap', description: 'Reduces the cost of your Thunder Clap ability by 1/2/3 rage.', classId: 'warrior', specName: 'Arms', tier: 2, row: 1, column: 1, maxRank: 3),
  Talent(id: 'w_a_imp_heros', name: 'Improved Heroic Strike', description: 'Reduces the cost of your Heroic Strike ability by 1/2/3 rage.', classId: 'warrior', specName: 'Arms', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'w_a_tactical_mastery', name: 'Tactical Mastery', description: 'Increases the threat reduction of your Hamstring and the duration of your Rend by 1/2/3 sec per rank.', classId: 'warrior', specName: 'Arms', tier: 2, row: 3, column: 3, maxRank: 3),
  Talent(id: 'w_a_deep_wounds', name: 'Deep Wounds', description: 'Your critical strikes cause the opponent to bleed, dealing damage over 12/24/36 sec.', classId: 'warrior', specName: 'Arms', tier: 3, row: 2, column: 2, maxRank: 3, prereqTalentId: 'w_a_twohand'),
  Talent(id: 'w_a_sweeping', name: 'Sweeping Strikes', description: 'Your next 5 melee attacks strike an additional nearby opponent.', classId: 'warrior', specName: 'Arms', tier: 4, row: 2, column: 2, maxRank: 1, prereqTalentId: 'w_a_deep_wounds'),
  Talent(id: 'w_a_mortality', name: 'Mortal Strike', description: 'A vicious strike that deals weapon damage plus 85 and wounds the target, reducing healing by 50% for 10 sec.', classId: 'warrior', specName: 'Arms', tier: 5, row: 2, column: 2, maxRank: 1, prereqTalentId: 'w_a_sweeping'),

  // --- Fury ---
  Talent(id: 'w_f_bloodthirst', name: 'Bloodthirst', description: 'Attack instantly, dealing damage equal to 35% of your attack power.', classId: 'warrior', specName: 'Fury', tier: 1, row: 3, column: 3, maxRank: 1),
  Talent(id: 'w_f_imp_whirlwind', name: 'Improved Whirlwind', description: 'Increases the duration of your Whirlwind ability by 1/2 sec.', classId: 'warrior', specName: 'Fury', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'w_f_dual_wield', name: 'Dual Wield Specialization', description: 'Increases the damage dealt by your off-hand weapon by 5/10/15/20/25%.', classId: 'warrior', specName: 'Fury', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_f_imp_bash', name: 'Improved Bash', description: 'Reduces the cooldown of your Bash ability.', classId: 'warrior', specName: 'Fury', tier: 2, row: 1, column: 1, maxRank: 3),
  Talent(id: 'w_f_improved_bloodthirst', name: 'Improved Bloodthirst', description: 'Increases the critical hit chance of your Bloodthirst ability by 1/2/3%.', classId: 'warrior', specName: 'Fury', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'w_f_cruelty', name: 'Cruelty', description: 'Increases the critical hit chance of your Bloodthirst by 1%.', classId: 'warrior', specName: 'Fury', tier: 3, row: 1, column: 1, maxRank: 1, prereqTalentId: 'w_f_bloodthirst'),
  Talent(id: 'w_f_flurry', name: 'Flurry', description: 'Increases your attack speed by 25/30/35% for your next 3 swings after dealing a melee critical strike.', classId: 'warrior', specName: 'Fury', tier: 3, row: 2, column: 2, maxRank: 3, prereqTalentId: 'w_f_improved_bloodthirst'),
  Talent(id: 'w_f_death_wish', name: 'Death Wish', description: 'Increases melee attack speed by 20% and attack power by 10% for 30 sec. Costs 10% max health.', classId: 'warrior', specName: 'Fury', tier: 4, row: 2, column: 2, maxRank: 1, prereqTalentId: 'w_f_flurry'),
  Talent(id: 'w_f_rampage', name: 'Rampage', description: 'Increases all critical strikes made by 10% for 10 sec. Stacks up to 5 times.', classId: 'warrior', specName: 'Fury', tier: 5, row: 2, column: 2, maxRank: 1, prereqTalentId: 'w_f_death_wish'),

  // --- Protection ---
  Talent(id: 'w_p_shield_slam', name: 'Shield Slam', description: 'Slam target enemy, dealing damage and reducing threat.', classId: 'warrior', specName: 'Protection', tier: 1, row: 3, column: 3, maxRank: 1),
  Talent(id: 'w_p_toughness', name: 'Toughness', description: 'Increases armor from items by 2/4/6/8/10%.', classId: 'warrior', specName: 'Protection', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_p_imp_charge', name: 'Improved Charge', description: 'Increases the amount of rage generated by your Charge by 3.', classId: 'warrior', specName: 'Protection', tier: 1, row: 2, column: 2, maxRank: 2),
  Talent(id: 'w_p_shield_spec', name: 'Shield Specialization', description: 'Increases chance to block attacks with a shield by 1/2/3/4/5% and has a 20/40/60/80/100% chance to generate 1 rage when a block occurs.', classId: 'warrior', specName: 'Protection', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_p_antici', name: 'Anticipation', description: 'Increases your chance to dodge by 1/2/3/4/5%.', classId: 'warrior', specName: 'Protection', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_p_last_stand_p', name: 'Last Stand', description: 'Temporarily grants 30% of your maximum health for 20 sec.', classId: 'warrior', specName: 'Protection', tier: 3, row: 1, column: 1, maxRank: 1, prereqTalentId: 'w_p_shield_spec'),
  Talent(id: 'w_p_shield_block', name: 'Improved Shield Block', description: 'Increases block value by 10/20/30% and allows your shield to block a third attack.', classId: 'warrior', specName: 'Protection', tier: 3, row: 2, column: 2, maxRank: 3),
  Talent(id: 'w_p_devastate', name: 'Devastate', description: 'Instantly strike the target, dealing damage and increasing Sunder Armor by 1.', classId: 'warrior', specName: 'Protection', tier: 4, row: 1, column: 1, maxRank: 1, prereqTalentId: 'w_p_last_stand_p'),
  Talent(id: 'w_p_shockwave', name: 'Shockwave', description: 'You send a wave of force in front of you, causing damage and stunning all enemies for 2 sec.', classId: 'warrior', specName: 'Protection', tier: 5, row: 2, column: 2, maxRank: 1, prereqTalentId: 'w_p_shield_block'),

  // ============================================================
  // PALADIN
  // ============================================================

  // --- Retribution ---
  Talent(id: 'p_r_imp_judg', name: 'Improved Judgment', description: 'Increases the range of your Judgment by 10/20 yards.', classId: 'paladin', specName: 'Retribution', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'p_r_imp_jus', name: 'Improved Blessing of Might', description: 'Increases the attack power bonus of your Blessing of Might by 5/10/15%.', classId: 'paladin', specName: 'Retribution', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_r_benediction', name: 'Benediction', description: 'Reduces the mana cost of your Blessings by 3/7/10/14/18%.', classId: 'paladin', specName: 'Retribution', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'p_r_deflection', name: 'Deflection', description: 'Increases your parry chance by 1/2/3/4/5%.', classId: 'paladin', specName: 'Retribution', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'p_r_twohand_p', name: 'Two-Handed Weapon Specialization', description: 'Increases the damage you deal with two-handed melee weapons by 2/4/6/8/10%.', classId: 'paladin', specName: 'Retribution', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'p_r_seal_of_cmd', name: 'Seal of Command', description: 'Increases damage dealt by Seal of Command by 10/20/30/40/50%.', classId: 'paladin', specName: 'Retribution', tier: 2, row: 3, column: 3, maxRank: 5),
  Talent(id: 'p_r_retribution_aura', name: 'Retribution Aura', description: 'Increases the damage done by your Retribution Aura by 25/50%.', classId: 'paladin', specName: 'Retribution', tier: 3, row: 1, column: 1, maxRank: 2),
  Talent(id: 'p_r_repentance', name: 'Repentance', description: 'Puts the enemy target in a state of meditation, incapacitating them for up to 6 sec.', classId: 'paladin', specName: 'Retribution', tier: 3, row: 2, column: 2, maxRank: 1, prereqTalentId: 'p_r_seal_of_cmd'),
  Talent(id: 'p_r_sanc_cmd', name: 'Sanctified Seals', description: 'Increases the damage of your seals and judgments by 3/6/10%.', classId: 'paladin', specName: 'Retribution', tier: 4, row: 1, column: 1, maxRank: 3),
  Talent(id: 'p_r_vengance', name: 'Vengeance', description: 'Increases Holy and critical strike damage by 3/6/10%.', classId: 'paladin', specName: 'Retribution', tier: 4, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_r_divine_storm', name: 'Divine Storm', description: 'Instantly strikes, dealing 110% weapon damage to up to 4 enemies.', classId: 'paladin', specName: 'Retribution', tier: 5, row: 2, column: 2, maxRank: 1, prereqTalentId: 'p_r_vengance'),

  // --- Holy ---
  Talent(id: 'p_h_divine_strength', name: 'Divine Strength', description: 'Increases your Strength by 2/4/6/8/10%.', classId: 'paladin', specName: 'Holy', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'p_h_spiritual', name: 'Spiritual Focus', description: 'Gives your Flash of Light and Holy Light spells a 14/28/42/56/70% chance to not be delayed by taking damage.', classId: 'paladin', specName: 'Holy', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'p_h_seals_p', name: 'Improved Seal of Righteousness', description: 'Increases damage dealt by Seal of Righteousness by 3/6%.', classId: 'paladin', specName: 'Holy', tier: 1, row: 3, column: 3, maxRank: 2),
  Talent(id: 'p_h_healing_light', name: 'Healing Light', description: 'Increases the amount healed by your Holy Light and Flash of Light spells by 4/8/12%.', classId: 'paladin', specName: 'Holy', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_h_enlight', name: 'Enlightenment', description: 'Increases your Intellect by 2/4/6% and reduces threat from healing by 5/10/15%.', classId: 'paladin', specName: 'Holy', tier: 3, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_h_holy_shock', name: 'Holy Shock', description: 'Instantly deals Holy damage or heals a friendly target.', classId: 'paladin', specName: 'Holy', tier: 4, row: 2, column: 2, maxRank: 1),

  // --- Protection (Paladin) ---
  Talent(id: 'p_p_redoubt', name: 'Redoubt', description: 'Increases block chance by 30% for 10 sec or 5 blocks after being critically hit.', classId: 'paladin', specName: 'Protection', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'p_p_precision', name: 'Precision', description: 'Increases melee hit chance by 1/2/3%.', classId: 'paladin', specName: 'Protection', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_p_devotion', name: 'Devotion Aura', description: 'Increases armor of party members by 1/2/3/4/5%.', classId: 'paladin', specName: 'Protection', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'p_p_tough_holy', name: 'Toughness', description: 'Increases your armor value from items by 2/4/6/8/10%.', classId: 'paladin', specName: 'Protection', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'p_p_imp_freedom', name: 'Improved Freedom', description: 'Reduces cooldown of Blessing of Freedom by 3/6/10 sec.', classId: 'paladin', specName: 'Protection', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_p_anger', name: 'Blessing of Kings', description: 'Multiplies target stats by 10% for 5 min.', classId: 'paladin', specName: 'Protection', tier: 3, row: 2, column: 2, maxRank: 1),
  Talent(id: 'p_p_holy_shield_p', name: 'Holy Shield', description: 'Increases chance to block by 30% for 10 sec, deals Holy damage when blocking.', classId: 'paladin', specName: 'Protection', tier: 5, row: 2, column: 2, maxRank: 1),

  // ============================================================
  // HUNTER
  // ============================================================

  // --- Beast Mastery ---
  Talent(id: 'h_bm_end_train', name: 'Endurance Training', description: 'Increases your pet max health by 3/6/9/12/15%.', classId: 'hunter', specName: 'Beast Mastery', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'h_bm_ferocity', name: 'Ferocity', description: 'Increases critical strike chance of your pet by 2/4/6/8/10%.', classId: 'hunter', specName: 'Beast Mastery', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'h_bm_thick', name: 'Thick Hide', description: 'Increases your pet armor by 4/7/10/14/17%.', classId: 'hunter', specName: 'Beast Mastery', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'h_bm_unl_beast', name: 'Unleashed Fury', description: 'Increases damage of pet attacks by 4/8/12/16/20%.', classId: 'hunter', specName: 'Beast Mastery', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'h_bm_mend', name: 'Improved Mend Pet', description: 'Gives Mend Pet a 15/50% chance to cleanse debuffs.', classId: 'hunter', specName: 'Beast Mastery', tier: 2, row: 2, column: 2, maxRank: 2),
  Talent(id: 'h_bm_best_disc', name: 'Bestial Discipline', description: 'Increases pet Focus by 10/20/30.', classId: 'hunter', specName: 'Beast Mastery', tier: 3, row: 1, column: 1, maxRank: 3),
  Talent(id: 'h_bm_frenzy_p', name: 'Frenzy', description: 'Gives pet 25% attack speed for 8/16 sec after a crit.', classId: 'hunter', specName: 'Beast Mastery', tier: 3, row: 2, column: 2, maxRank: 2),
  Talent(id: 'h_bm_best_wrath', name: 'Bestial Wrath', description: 'Sends pet into a frenzy, dealing 50% more damage for 18 sec.', classId: 'hunter', specName: 'Beast Mastery', tier: 4, row: 2, column: 2, maxRank: 1),
  Talent(id: 'h_bm_beast_mastery', name: 'Beast Mastery', description: 'Increases pet attack speed by 3/6/10% and damage by 3/6/10%.', classId: 'hunter', specName: 'Beast Mastery', tier: 4, row: 1, column: 1, maxRank: 3),

  // --- Marksmanship ---
  Talent(id: 'h_mm_concuss', name: 'Improved Concussive Shot', description: 'Gives Concussive Shot 100% chance to stun for 2/3 sec.', classId: 'hunter', specName: 'Marksmanship', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'h_mm_efficiency', name: 'Efficiency', description: 'Reduces mana cost of shots by 2/4/6/8/10%.', classId: 'hunter', specName: 'Marksmanship', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'h_mm_lethargic', name: 'Lethal Shots', description: 'Increases critical strike chance of all shots by 1/2/3/4/5%.', classId: 'hunter', specName: 'Marksmanship', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'h_mm_aimed', name: 'Aimed Shot', description: 'Fires an aimed shot, increasing ranged damage by 100/150%.', classId: 'hunter', specName: 'Marksmanship', tier: 2, row: 2, column: 2, maxRank: 1),
  Talent(id: 'h_mm_mortal_p', name: 'Mortal Shots', description: 'Increases ranged critical strike damage by 6/12/18/24/30%.', classId: 'hunter', specName: 'Marksmanship', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'h_mm_go_for_the_throat', name: 'Go For the Throat', description: 'Your critical shots give 10/20 Focus to your pet.', classId: 'hunter', specName: 'Marksmanship', tier: 3, row: 2, column: 2, maxRank: 2),
  Talent(id: 'h_mm_combat_exp', name: 'Combat Experience', description: 'Increases damage by 1/2/3% and all resistances by 2/4/6%.', classId: 'hunter', specName: 'Marksmanship', tier: 4, row: 2, column: 2, maxRank: 3),
  Talent(id: 'h_mm_kill_shot', name: 'Kill Shot', description: 'Fires a killing blow on targets with less than 20% health.', classId: 'hunter', specName: 'Marksmanship', tier: 5, row: 2, column: 2, maxRank: 1),

  // --- Survival ---
  Talent(id: 'h_sv_tracking', name: 'Improved Tracking', description: 'Increases damage by 1/2/3/4/5% while tracking.', classId: 'hunter', specName: 'Survival', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'h_sv_deflection', name: 'Deflection', description: 'Increases parry chance by 1/2/3/4/5%.', classId: 'hunter', specName: 'Survival', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'h_sv_entrapment', name: 'Entrapment', description: 'Gives Immolation/Freezing traps 8/15/25% chance to root.', classId: 'hunter', specName: 'Survival', tier: 1, row: 3, column: 3, maxRank: 3),
  Talent(id: 'h_sv_hawk_eye', name: 'Hawk Eye', description: 'Increases ranged weapon range by 2/4/6 yards.', classId: 'hunter', specName: 'Survival', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'h_sv_wyvern', name: 'Wyvern Sting', description: 'Puts target to sleep for 12 sec, dealing damage over time.', classId: 'hunter', specName: 'Survival', tier: 2, row: 3, column: 3, maxRank: 1),
  Talent(id: 'h_sv_improved_ww', name: 'Improved Wing Clip', description: 'Reduces chance to resist Wing Clip by 10/20%.', classId: 'hunter', specName: 'Survival', tier: 3, row: 1, column: 1, maxRank: 2),
  Talent(id: 'h_sv_surv_inst', name: 'Survival Instincts', description: 'Increases dodge and parry chance by 2/4/6%.', classId: 'hunter', specName: 'Survival', tier: 4, row: 2, column: 2, maxRank: 3),
  Talent(id: 'h_sv_explosive_p', name: 'Explosive Shot', description: 'Fires an explosive shot that deals Arcane damage over 5 sec.', classId: 'hunter', specName: 'Survival', tier: 5, row: 2, column: 2, maxRank: 1),

  // ============================================================
  // ROGUE
  // ============================================================

  // --- Combat ---
  Talent(id: 'r_c_improved_sin', name: 'Improved Sinister Strike', description: 'Reduces energy cost by 3/5.', classId: 'rogue', specName: 'Combat', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'r_c_lightning', name: 'Lightning Reflexes', description: 'Increases dodge chance by 2/4/6/8/10%.', classId: 'rogue', specName: 'Combat', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'r_c_precision', name: 'Precision', description: 'Increases melee hit chance by 1/2/3%.', classId: 'rogue', specName: 'Combat', tier: 1, row: 3, column: 3, maxRank: 3),
  Talent(id: 'r_c_improved_slice', name: 'Improved Slice and Dice', description: 'Prolongs duration by 15/30%.', classId: 'rogue', specName: 'Combat', tier: 2, row: 1, column: 1, maxRank: 2),
  Talent(id: 'r_c_blade_fury', name: 'Blade Fury', description: 'Instant melee strikes for 50% weapon damage in an area.', classId: 'rogue', specName: 'Combat', tier: 2, row: 2, column: 2, maxRank: 1),
  Talent(id: 'r_c_blade_fury2', name: 'Sword Specialization', description: 'Gives a 1% chance per rank of an extra attack with swords.', classId: 'rogue', specName: 'Combat', tier: 3, row: 1, column: 1, maxRank: 5),
  Talent(id: 'r_c_aggression', name: 'Aggression', description: 'Increases Sinister Strike and Eviscerate damage by 4/7/10%.', classId: 'rogue', specName: 'Combat', tier: 3, row: 2, column: 2, maxRank: 3),
  Talent(id: 'r_c_adrenaline_p', name: 'Adrenaline Rush', description: 'Generates 60 energy and reduces cooldowns by 60% for 15 sec.', classId: 'rogue', specName: 'Combat', tier: 5, row: 2, column: 2, maxRank: 1),

  // --- Subtlety ---
  Talent(id: 'r_s_master_of', name: 'Master of Deception', description: 'Reduces chance enemies detect you while stealthed by 5/10/15/20%.', classId: 'rogue', specName: 'Subtlety', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'r_s_opportunity', name: 'Opportunity', description: 'Increases backstab/ambush/garrote damage by 4/8/12/16/20%.', classId: 'rogue', specName: 'Subtlety', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'r_s_camouflage', name: 'Camouflage', description: 'Reduces cooldown of Stealth by 1/2/3 sec.', classId: 'rogue', specName: 'Subtlety', tier: 1, row: 3, column: 3, maxRank: 3),
  Talent(id: 'r_s_elusiveness', name: 'Elusiveness', description: 'Reduces cooldown of Vanish and Blind by 45/90 sec.', classId: 'rogue', specName: 'Subtlety', tier: 2, row: 1, column: 1, maxRank: 2),
  Talent(id: 'r_s_sleight', name: 'Sleight of Hand', description: 'Reduces threat by 8/16% and increases dodge by 2/4%.', classId: 'rogue', specName: 'Subtlety', tier: 2, row: 2, column: 2, maxRank: 2),
  Talent(id: 'r_s_setup', name: 'Setup', description: 'Gives 25/50/75% chance for Evasive abilities to add a combo point.', classId: 'rogue', specName: 'Subtlety', tier: 3, row: 2, column: 2, maxRank: 3),
  Talent(id: 'r_s_shadowstep', name: 'Shadowstep', description: 'Teleport behind target, increasing damage by 20% for 10 sec.', classId: 'rogue', specName: 'Subtlety', tier: 4, row: 2, column: 2, maxRank: 1),

  // --- Outlaw ---
  Talent(id: 'r_o_improved_evis', name: 'Improved Eviscerate', description: 'Increases Eviscerate damage by 5/10/15%.', classId: 'rogue', specName: 'Outlaw', tier: 1, row: 1, column: 1, maxRank: 3),
  Talent(id: 'r_o_removal', name: 'Remorseless Attacks', description: 'Increases crit after a kill by 20/40% for 20 sec.', classId: 'rogue', specName: 'Outlaw', tier: 1, row: 2, column: 2, maxRank: 2),
  Talent(id: 'r_o_imp_gouge', name: 'Improved Gouge', description: 'Reduces energy cost of Gouge by 10/20/30.', classId: 'rogue', specName: 'Outlaw', tier: 2, row: 1, column: 1, maxRank: 3),
  Talent(id: 'r_o_thrust_p', name: 'Thrust', description: 'Increases thrust damage by 100%.', classId: 'rogue', specName: 'Outlaw', tier: 2, row: 2, column: 2, maxRank: 1),
  Talent(id: 'r_o_sword_spec', name: 'Sword Specialization', description: 'Extra attack chance with swords: 1/2/3/4/5%.', classId: 'rogue', specName: 'Outlaw', tier: 3, row: 1, column: 1, maxRank: 5),
  Talent(id: 'r_o_blade_fury_o', name: 'Blade Flurry', description: 'Attacks hit an additional nearby target for 50% damage.', classId: 'rogue', specName: 'Outlaw', tier: 3, row: 2, column: 2, maxRank: 1),
  Talent(id: 'r_o_killing_spree', name: 'Killing Spree', description: 'Teleport to random nearby enemies and attack for 2 sec.', classId: 'rogue', specName: 'Outlaw', tier: 5, row: 2, column: 2, maxRank: 1),

  // ============================================================
  // PRIEST
  // ============================================================

  // --- Discipline ---
  Talent(id: 'p_d_unbroken_will', name: 'Unbreakable Will', description: 'Increases chance to resist stun, fear, and charm by 3/6/9/12/15%.', classId: 'priest', specName: 'Discipline', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'p_d_wand_spec', name: 'WandSpecialization', description: 'Increases wand damage by 13/26/40%.', classId: 'priest', specName: 'Discipline', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_d_silent_resolve', name: 'Silent Resolve', description: 'Reduces threat of all spells by 4/8/12/16/20%.', classId: 'priest', specName: 'Discipline', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'p_d_inner_fire', name: 'Inner Focus', description: 'Next spell cast has 0 mana cost and increased crit.', classId: 'priest', specName: 'Discipline', tier: 2, row: 2, column: 2, maxRank: 1),
  Talent(id: 'p_d_imp_pws', name: 'Improved Power Word: Shield', description: 'Increases shield strength by 5/10/15/20%.', classId: 'priest', specName: 'Discipline', tier: 3, row: 2, column: 2, maxRank: 4),
  Talent(id: 'p_d_reflective_shield', name: 'Reflective Shield', description: 'Shields deal 10/20% damage to attackers.', classId: 'priest', specName: 'Discipline', tier: 4, row: 1, column: 1, maxRank: 2),
  Talent(id: 'p_d_power_infusion', name: 'Power Infusion', description: 'Increases casting speed by 20% and reduces mana costs by 20% for 15 sec.', classId: 'priest', specName: 'Discipline', tier: 5, row: 2, column: 2, maxRank: 1),

  // --- Holy (Priest) ---
  Talent(id: 'p_hp_healing_p', name: 'Healing Focus', description: 'Reduces spell pushback by 35/70%.', classId: 'priest', specName: 'Holy', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'p_hp_improved_renew', name: 'Improved Renew', description: 'Increases Renew healing by 5/10/15%.', classId: 'priest', specName: 'Holy', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_hp_holy_spec', name: 'Holy Specialization', description: 'Increases crit chance of all Holy spells by 1/2/3/4/5%.', classId: 'priest', specName: 'Holy', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'p_hp_spirit', name: 'Spiritual Guidance', description: 'Increases spell damage and healing by 5/10/15/20/25% of Spirit.', classId: 'priest', specName: 'Holy', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'p_hp_spirit_healing', name: 'Spiritual Healing', description: 'Reduces mana cost of all spells by 2/4/6/8/10%.', classId: 'priest', specName: 'Holy', tier: 3, row: 2, column: 2, maxRank: 5),
  Talent(id: 'p_hp_lights', name: 'Lightwell', description: 'Create a Lightwell that heals allies for 20% max health.', classId: 'priest', specName: 'Holy', tier: 5, row: 1, column: 1, maxRank: 1),
  Talent(id: 'p_hp_guardian', name: 'Guardian Spirit', description: 'Summons a spirit that heals target for 40% max HP if killed.', classId: 'priest', specName: 'Holy', tier: 5, row: 2, column: 2, maxRank: 1),

  // --- Shadow ---
  Talent(id: 'p_s_spirit_tap', name: 'Spirit Tap', description: 'Gives 100% chance to gain 10% max mana after killing target.', classId: 'priest', specName: 'Shadow', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'p_s_darkness', name: 'Darkness', description: 'Increases Shadow damage by 2/4/6/8/10%.', classId: 'priest', specName: 'Shadow', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'p_s_shadow_aff', name: 'Shadow Affinity', description: 'Reduces threat by 8/16/25%.', classId: 'priest', specName: 'Shadow', tier: 1, row: 3, column: 3, maxRank: 3),
  Talent(id: 'p_s_imp_mf', name: 'Improved Mind Flay', description: 'Increases Mind Flay damage by 5/10/15/20/25%.', classId: 'priest', specName: 'Shadow', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'p_s_shadow_focus', name: 'Shadow Focus', description: 'Increases hit chance of Shadow spells by 1/2/3%.', classId: 'priest', specName: 'Shadow', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'p_s_vampiric', name: 'Vampiric Embrace', description: 'Your Shadow spells heal nearby party members.', classId: 'priest', specName: 'Shadow', tier: 3, row: 3, column: 3, maxRank: 1),
  Talent(id: 'p_s_shadowform', name: 'Shadowform', description: 'Transform into Shadow, increasing Shadow damage by 15%.', classId: 'priest', specName: 'Shadow', tier: 5, row: 2, column: 2, maxRank: 1),

  // ============================================================
  // DEATH KNIGHT
  // ============================================================

  // --- Blood ---
  Talent(id: 'dk_b_butcher', name: 'Butchery', description: 'Generates 1/2/3/4/5 Runic Power every 3 sec in combat.', classId: 'death_knight', specName: 'Blood', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'dk_b_subversion', name: 'Subversion', description: 'Reduces threat by 8/16/25%.', classId: 'death_knight', specName: 'Blood', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'dk_b_blood_strike', name: 'Blood Strike', description: 'Inflict 90% weapon damage, healing for each Blood Plague.', classId: 'death_knight', specName: 'Blood', tier: 1, row: 3, column: 3, maxRank: 1),
  Talent(id: 'dk_b_imp_bloodstrike', name: 'Improved Blood Strike', description: 'Increases Blood Strike damage by 5/10/15/20/25%.', classId: 'death_knight', specName: 'Blood', tier: 2, row: 1, column: 1, maxRank: 5),
  Talent(id: 'dk_b_blood_armor', name: 'Blood Armor', description: 'Increases armor by 5/10/15% and healing received by 5/10/15%.', classId: 'death_knight', specName: 'Blood', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'dk_b_vampiric_blood', name: 'Vampiric Blood', description: 'Temporarily grants 15% max HP and heals by 10%.', classId: 'death_knight', specName: 'Blood', tier: 4, row: 2, column: 2, maxRank: 1),
  Talent(id: 'dk_b_dancing_runeweapon', name: 'Dancing Rune Weapon', description: 'Summons a Dancing Rune Weapon that mimics melee attacks.', classId: 'death_knight', specName: 'Blood', tier: 5, row: 3, column: 3, maxRank: 1),

  // --- Frost (DK) ---
  Talent(id: 'dk_f_runic', name: 'Runic Power Mastery', description: 'Increases max Runic Power by 10/20/30.', classId: 'death_knight', specName: 'Frost', tier: 1, row: 1, column: 1, maxRank: 3),
  Talent(id: 'dk_f_improved_ic', name: 'Improved Icy Clutch', description: 'Your Icy attacks slow enemies by 10/20/30%.', classId: 'death_knight', specName: 'Frost', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'dk_f_blade_barrier', name: 'Blade Barrier', description: 'Increases damage by 2/4/6/8/10% when both Blood runes on cooldown.', classId: 'death_knight', specName: 'Frost', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'dk_f_icy_touch', name: 'Improved Icy Touch', description: 'Increases damage of Icy Touch by 15/30/45%.', classId: 'death_knight', specName: 'Frost', tier: 3, row: 1, column: 1, maxRank: 3),
  Talent(id: 'dk_f_howling_blast', name: 'Howling Blast', description: 'Blizzard-like attack dealing Frost damage in an area.', classId: 'death_knight', specName: 'Frost', tier: 3, row: 3, column: 3, maxRank: 1),
  Talent(id: 'dk_f_lichborne_p', name: 'Lichborne', description: 'Become immune to Charm, Fear, and Sleep for 10 sec.', classId: 'death_knight', specName: 'Frost', tier: 2, row: 1, column: 1, maxRank: 1),
  Talent(id: 'dk_f_unbreakable', name: 'Unbreakable Armor', description: 'Increases armor by 60% and Strength by 20% for 20 sec.', classId: 'death_knight', specName: 'Frost', tier: 4, row: 2, column: 2, maxRank: 1),

  // --- Unholy ---
  Talent(id: 'dk_u_imp_iu', name: 'Impaled', description: 'Increases critical damage by 10/20/30%.', classId: 'death_knight', specName: 'Unholy', tier: 1, row: 1, column: 1, maxRank: 3),
  Talent(id: 'dk_u_vendetta', name: 'Vendetta', description: 'Your Killing Machine gives you 3 Runic Power.', classId: 'death_knight', specName: 'Unholy', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'dk_u_unholy_command', name: 'Unholy Command', description: 'Increases melee attack speed by 2/4%.', classId: 'death_knight', specName: 'Unholy', tier: 1, row: 3, column: 3, maxRank: 2),
  Talent(id: 'dk_u_outbreak', name: 'Outbreak', description: 'Your diseases increase your damage by 2/4%.', classId: 'death_knight', specName: 'Unholy', tier: 2, row: 2, column: 2, maxRank: 2),
  Talent(id: 'dk_u_master_of', name: 'Master of Ghouls', description: 'Your Ghoul lasts permanently and gains abilities.', classId: 'death_knight', specName: 'Unholy', tier: 4, row: 2, column: 2, maxRank: 1),
  Talent(id: 'dk_u_antimagic', name: 'Anti-Magic Shell', description: 'Absorbs 75% of magic damage for up to 10 sec.', classId: 'death_knight', specName: 'Unholy', tier: 3, row: 1, column: 1, maxRank: 1),

  // ============================================================
  // SHAMAN
  // ============================================================

  // --- Elemental ---
  Talent(id: 's_e_convection', name: 'Convection', description: 'Reduces mana cost of all spells by 2/4/6/8/10%.', classId: 'shaman', specName: 'Elemental', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 's_e_concussion', name: 'Concussion', description: 'Increases Lightning Bolt/Chain Lightning damage by 1/2/3/4/5%.', classId: 'shaman', specName: 'Elemental', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 's_e_earth_grasp', name: 'Earth\'s Grasp', description: 'Reduces Earth Shock cooldown by 1/2/3/4/5 sec.', classId: 'shaman', specName: 'Elemental', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 's_e_reverberation', name: 'Reverberation', description: 'Reduces Shock cooldown by .4/.8 sec.', classId: 'shaman', specName: 'Elemental', tier: 2, row: 1, column: 1, maxRank: 2),
  Talent(id: 's_e_call_flame', name: 'Call of Flame', description: 'Increases Fire Totem damage by 5/10/15%.', classId: 'shaman', specName: 'Elemental', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 's_e_elemental_focus', name: 'Elemental Focus', description: 'Next two Nature spells cost 40% less mana.', classId: 'shaman', specName: 'Elemental', tier: 3, row: 2, column: 2, maxRank: 1),
  Talent(id: 's_e_chain_lightning', name: 'Chain Lightning', description: 'Fires lightning that arcs to 3 additional targets.', classId: 'shaman', specName: 'Elemental', tier: 4, row: 2, column: 2, maxRank: 1),

  // --- Enhancement ---
  Talent(id: 's_en_bloodlust', name: 'Bloodlust', description: 'Increases haste by 30% for all party members for 40 sec.', classId: 'shaman', specName: 'Enhancement', tier: 1, row: 3, column: 3, maxRank: 1),
  Talent(id: 's_en_shamanistic', name: 'Shamanistic Focus', description: 'Gives 10/20/30% chance to gain mana on melee hits.', classId: 'shaman', specName: 'Enhancement', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 's_en_ancestral_knowledge', name: 'Ancestral Knowledge', description: 'Increases Intellect by 2/4/6/8/10%.', classId: 'shaman', specName: 'Enhancement', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 's_en_ghost_wolf', name: 'Improved Ghost Wolf', description: 'Reduces cast time by 1/2 sec.', classId: 'shaman', specName: 'Enhancement', tier: 2, row: 1, column: 1, maxRank: 2),
  Talent(id: 's_en_weapons', name: 'Enhancing Totems', description: 'Increases effect of Strength/Haste totems by 5/10/15/20/25%.', classId: 'shaman', specName: 'Enhancement', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 's_en_stormstrike', name: 'Stormstrike', description: 'Charges weapon with lightning, dealing Nature damage.', classId: 'shaman', specName: 'Enhancement', tier: 4, row: 2, column: 2, maxRank: 1),

  // --- Restoration ---
  Talent(id: 's_r_improved_healing', name: 'Improved Healing Wave', description: 'Reduces cast time by .2/.4 sec.', classId: 'shaman', specName: 'Restoration', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 's_r_tidal_focus', name: 'Tidal Focus', description: 'Reduces mana cost of Healing spells by 1/2/3/4/5%.', classId: 'shaman', specName: 'Restoration', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 's_r_imp_lesser_healing', name: 'Improved Lesser Healing Wave', description: 'Increases healing by 5/10/15%.', classId: 'shaman', specName: 'Restoration', tier: 1, row: 3, column: 3, maxRank: 3),
  Talent(id: 's_r_ancestral_', name: 'Ancestral Healing', description: 'Increases target armor by 2/4/6% and heals for additional 5/10%.', classId: 'shaman', specName: 'Restoration', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 's_r_nature_guardian', name: 'Nature\'s Guardian', description: 'When health drops below 30%, instant heal for 20%.', classId: 'shaman', specName: 'Restoration', tier: 3, row: 2, column: 2, maxRank: 1),
  Talent(id: 's_r_totem_of_f', name: 'Totem of Focus', description: 'Reduces mana cost of totems by 5/10%.', classId: 'shaman', specName: 'Restoration', tier: 4, row: 2, column: 2, maxRank: 2),

  // ============================================================
  // MAGE
  // ============================================================

  // --- Arcane ---
  Talent(id: 'm_arc_arcane_sub', name: 'Arcane Subtlety', description: 'Reduces threat from Arcane spells by 20/40% and resistances by 2/4.', classId: 'mage', specName: 'Arcane', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'm_arc_imp_arc_miss', name: 'Improved Arcane Missiles', description: 'Reduces casting cooldown of Arcane Missiles by 0.2/0.4 sec per cast.', classId: 'mage', specName: 'Arcane', tier: 1, row: 2, column: 2, maxRank: 2),
  Talent(id: 'm_arc_arcane_focus', name: 'Arcane Focus', description: 'Reduces chance enemies resist Arcane spells by 2/4/6/8/10%.', classId: 'mage', specName: 'Arcane', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'm_arc_imp_arcane_exp', name: 'Improved Arcane Explosion', description: 'Increases chance of freeze by 2/4% and damage by 25/50%.', classId: 'mage', specName: 'Arcane', tier: 2, row: 1, column: 1, maxRank: 2),
  Talent(id: 'm_arc_magic_abs', name: 'Magic Absorption', description: 'Increases all resistances by 2/4/6.', classId: 'mage', specName: 'Arcane', tier: 2, row: 2, column: 2, maxRank: 3),
  Talent(id: 'm_arc_arcane_mind', name: 'Arcane Mind', description: 'Increases max mana by 4/7/10%.', classId: 'mage', specName: 'Arcane', tier: 3, row: 2, column: 2, maxRank: 3),
  Talent(id: 'm_arc_presence', name: 'Arcane Power', description: 'Increases damage by 30%, mana cost by 30%, for 15 sec.', classId: 'mage', specName: 'Arcane', tier: 5, row: 2, column: 2, maxRank: 1),

  // --- Fire (existing + expanded) ---
  Talent(id: 'm_f_imp_fireball', name: 'Improved Fireball', description: 'Reduces Fireball cast time by .05/.1/.15/.2/.25 sec.', classId: 'mage', specName: 'Fire', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'm_f_imp_sc', name: 'Impact', description: 'Gives Fire spells 2/4/6/8/10% chance to stun target for 2 sec.', classId: 'mage', specName: 'Fire', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'm_f_burning', name: 'Burning Soul', description: 'Reduces interrupt chance and threat by 15/35%.', classId: 'mage', specName: 'Fire', tier: 2, row: 1, column: 1, maxRank: 2),
  Talent(id: 'm_f_imp_fire_blast', name: 'Improved Flamestrike', description: 'Increases Flamestrike damage by 5/10% and chance to crit by 5/10%.', classId: 'mage', specName: 'Fire', tier: 3, row: 2, column: 2, maxRank: 2),
  Talent(id: 'm_f_pyroblast', name: 'Pyroblast', description: 'Hurls a massive fireball dealing massive Fire damage over time.', classId: 'mage', specName: 'Fire', tier: 4, row: 2, column: 2, maxRank: 1),

  // --- Frost (existing + expanded) ---
  Talent(id: 'm_fr_winters_chill', name: 'Winter\'s Chill', description: 'Frost spells increase spell crit chance against target by 2/4%.', classId: 'mage', specName: 'Frost', tier: 1, row: 2, column: 2, maxRank: 2),
  Talent(id: 'm_fr_imp_frostbolt', name: 'Improved Frostbolt', description: 'Reduces Frostbolt cast time by .1/.2 sec.', classId: 'mage', specName: 'Frost', tier: 1, row: 3, column: 3, maxRank: 2),
  Talent(id: 'm_fr_frost_ward', name: 'Frost Warding', description: 'Increases Frost/Ice resist and reduces damage by 5/10%.', classId: 'mage', specName: 'Frost', tier: 2, row: 2, column: 2, maxRank: 2),
  Talent(id: 'm_fr_shatter', name: 'Shatter', description: 'Increases crit chance of all spells against frozen targets by 10/25/40%.', classId: 'mage', specName: 'Frost', tier: 3, row: 2, column: 2, maxRank: 3),
  Talent(id: 'm_fr_cone_of_cold', name: 'Cold Snap', description: 'Resets cooldown of all Frost spell damage abilities.', classId: 'mage', specName: 'Frost', tier: 4, row: 2, column: 2, maxRank: 1),

  // ============================================================
  // WARLOCK
  // ============================================================

  // --- Affliction ---
  Talent(id: 'w_a_suppression', name: 'Suppression', description: 'Reduces chance enemies resist Affliction spells by 2/4/6/8/10%.', classId: 'warlock', specName: 'Affliction', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_a_improved_cur', name: 'Improved Curse of Weakness', description: 'Reduces speed of target by an additional 3/6%.', classId: 'warlock', specName: 'Affliction', tier: 1, row: 2, column: 2, maxRank: 2),
  Talent(id: 'w_a_impt_corruption', name: 'Improved Corruption', description: 'Reduces cast time of Corruption by .4/.8/1.2/1.6/2 sec.', classId: 'warlock', specName: 'Affliction', tier: 1, row: 3, column: 3, maxRank: 5),
  Talent(id: 'w_a_dark_pact', name: 'Dark Pact', description: 'Drains 150 mana from pet, giving you 100 mana.', classId: 'warlock', specName: 'Affliction', tier: 2, row: 1, column: 1, maxRank: 1),
  Talent(id: 'w_a_shadow_mastery', name: 'Shadow Mastery', description: 'Increases Shadow spell damage by 2/4/6/8/10%.', classId: 'warlock', specName: 'Affliction', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_a_siphon_life', name: 'Siphon Life', description: 'Drains life from target, healing warlock over 30 sec.', classId: 'warlock', specName: 'Affliction', tier: 4, row: 2, column: 2, maxRank: 1),
  Talent(id: 'w_a_unstable', name: 'Unstable Affliction', description: 'Afflicts target with 1800 damage over 15 sec. Silences dispeller.', classId: 'warlock', specName: 'Affliction', tier: 5, row: 2, column: 2, maxRank: 1),

  // --- Demonology ---
  Talent(id: 'w_d_imp_healthstone', name: 'Improved Healthstone', description: 'Increases Healthstone healing by 10/20%.', classId: 'warlock', specName: 'Demonology', tier: 1, row: 1, column: 1, maxRank: 2),
  Talent(id: 'w_d_demonic_embrace', name: 'Demonic Embrace', description: 'Increases max health by 3/6/10/14% and reduces Spirit by 1/2/3%.', classId: 'warlock', specName: 'Demonology', tier: 1, row: 2, column: 2, maxRank: 3),
  Talent(id: 'w_d_imp_imp', name: 'Improved Imp', description: 'Increases Imp Firebolt damage by 20/40%.', classId: 'warlock', specName: 'Demonology', tier: 1, row: 3, column: 3, maxRank: 2),
  Talent(id: 'w_d_fel_dom', name: 'Fel Domination', description: 'Next Imp/Voidwalker/Succubus/Felhunter summon spell is free.', classId: 'warlock', specName: 'Demonology', tier: 2, row: 2, column: 2, maxRank: 1),
  Talent(id: 'w_d_master_summon', name: 'Master Summoner', description: 'Reduces Summon cast time by 1/2 sec.', classId: 'warlock', specName: 'Demonology', tier: 3, row: 1, column: 1, maxRank: 2),
  Talent(id: 'w_d_unholy_power', name: 'Unholy Power', description: 'Increases Voidwalker/Felguard damage by 4/8/12/16/20%.', classId: 'warlock', specName: 'Demonology', tier: 3, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_d_metamorphosis', name: 'Metamorphosis', description: 'Transform into a demon, increasing armor, stamina, and power.', classId: 'warlock', specName: 'Demonology', tier: 5, row: 3, column: 3, maxRank: 1),

  // --- Destruction ---
  Talent(id: 'w_des_impt_imp', name: 'Improved Shadow Bolt', description: 'Shadow Bolt crits increase spell crit by 1/2/3/4/5%.', classId: 'warlock', specName: 'Destruction', tier: 1, row: 1, column: 1, maxRank: 5),
  Talent(id: 'w_des_cataclysm', name: 'Cataclysm', description: 'Reduces mana cost of Destruction spells by 1/2/3/4/5%.', classId: 'warlock', specName: 'Destruction', tier: 1, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_des_bleed', name: 'Bane', description: 'Reduces cast time of Shadow Bolt and Rain of Fire by .2/.4 sec.', classId: 'warlock', specName: 'Destruction', tier: 1, row: 3, column: 3, maxRank: 2),
  Talent(id: 'w_des_aftermath', name: 'Aftermath', description: 'Gives Destruction spells 2/4/6/8/10% chance to disorient.', classId: 'warlock', specName: 'Destruction', tier: 2, row: 2, column: 2, maxRank: 5),
  Talent(id: 'w_des_fire', name: 'Destructive Reach', description: 'Increases radius of Destruction spells by 1/2 sec and damage by 5/10%.', classId: 'warlock', specName: 'Destruction', tier: 3, row: 2, column: 2, maxRank: 2),
  Talent(id: 'w_des_soul_fire', name: 'Soul Fire', description: 'Burns the enemy soul, dealing 300 Fire damage.', classId: 'warlock', specName: 'Destruction', tier: 4, row: 2, column: 2, maxRank: 1),
];
