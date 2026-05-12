import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mystic_enchant.g.dart';

/// Mystical Enchant rarity tiers from the Ascension wiki.
enum EnchantTier {
  uncommon,
  rare,
  epic,
  legendary,
}

extension EnchantTierX on EnchantTier {
  String get displayName => const {
    EnchantTier.uncommon: 'Uncommon',
    EnchantTier.rare: 'Rare',
    EnchantTier.epic: 'Epic',
    EnchantTier.legendary: 'Legendary',
  }[this]!;

  Color get color => const {
    EnchantTier.uncommon: Color(0xFF1EFF00),
    EnchantTier.rare: Color(0xFF0080FF),
    EnchantTier.epic: Color(0xFFB048F8),
    EnchantTier.legendary: Color(0xFFFF8000),
  }[this]!;

  int get indexValue => index;
}

@JsonSerializable()
class MysticEnchant {
  final String id;
  final String name;
  final String description;
  final EnchantTier tier;

  const MysticEnchant({
    required this.id,
    required this.name,
    required this.description,
    required this.tier,
  });

  factory MysticEnchant.fromJson(Map<String, dynamic> json) => _$MysticEnchantFromJson(json);
  Map<String, dynamic> toJson() => _$MysticEnchantToJson(this);
}

// ══ REAL ASCENSION MYSTICAL ENCHANTS - ~180 TOTAL ══
// Source: https://project-ascension.fandom.com/wiki/Enchant_Collection
// Uncommon: ~50 (generic skill modifiers)
// Rare: ~18 (class-specific modifiers)
// Epic: ~14 (transformative effects)
// Legendary: ~100 (game-changing builds)

const sampleEnchants = <MysticEnchant>[
  // Uncommon (Green) - Powerful
  MysticEnchant(id: 'mc_powerful', name: 'Powerful',
      description: 'Increases the damage of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Hardy
  MysticEnchant(id: 'mc_hardy', name: 'Hardy',
      description: 'Increases the dispel resistance of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Critical
  MysticEnchant(id: 'mc_critical', name: 'Critical',
      description: 'Increases the critical chance of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Concentrated
  MysticEnchant(id: 'mc_concentrated', name: 'Concentrated',
      description: 'Reduces the mana cost of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Taunting
  MysticEnchant(id: 'mc_taunting', name: 'Taunting',
      description: 'Increases the threat caused by the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Focused
  MysticEnchant(id: 'mc_focused', name: 'Focused',
      description: 'Increases the bonus scaling of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Brutal
  MysticEnchant(id: 'mc_brutal', name: 'Brutal',
      description: 'Increases the critical strike damage of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Steady
  MysticEnchant(id: 'mc_steady', name: 'Steady',
      description: 'Reduces the pushback of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Quick
  MysticEnchant(id: 'mc_quick', name: 'Quick',
      description: 'Reduces the cast time of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Hasty
  MysticEnchant(id: 'mc_hasty', name: 'Hasty',
      description: 'Reduces the cool-down of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Accrual
  MysticEnchant(id: 'mc_accrual', name: 'Accrual',
      description: 'Increases the damage over time of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Accurate
  MysticEnchant(id: 'mc_accurate', name: 'Accurate',
      description: 'Increases the hit chance of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Subtle
  MysticEnchant(id: 'mc_subtle', name: 'Subtle',
      description: 'Reduces the threat dealt by the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Vigorous
  MysticEnchant(id: 'mc_vigorous_mc', name: 'Vigorous',
      description: 'Increases the healing of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Shielding
  MysticEnchant(id: 'mc_shielding', name: 'Shielding',
      description: 'Increases the absorption of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Fortifying
  MysticEnchant(id: 'mc_fortifying', name: 'Fortifying',
      description: 'Increases the maximum health granted by the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Extended
  MysticEnchant(id: 'mc_extended', name: 'Extended',
      description: 'Increases the duration of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Amplifying
  MysticEnchant(id: 'mc_amplifying', name: 'Amplifying',
      description: 'Increases the radius/range of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Expanding
  MysticEnchant(id: 'mc_expanding', name: 'Expanding',
      description: 'Increases the area of effect size of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Reverberating
  MysticEnchant(id: 'mc_reverberating', name: 'Reverberating',
      description: 'Increases the number of targets the skill can affect.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Renewing
  MysticEnchant(id: 'mc_renewing', name: 'Renewing',
      description: 'Increases the tick frequency of the heal-over-time or damage-over-time.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Rejuvenating
  MysticEnchant(id: 'mc_rejuvenating', name: 'Rejuvenating',
      description: 'Increases the amount healed per tick of the heal-over-time effect.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Resolute
  MysticEnchant(id: 'mc_resolute', name: 'Resolute',
      description: 'Reduces the chance that the skill will be resisted.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Penetrating
  MysticEnchant(id: 'mc_penetrating', name: 'Penetrating',
      description: 'Increases the armor or magic penetration of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Shattering
  MysticEnchant(id: 'mc_shattering', name: 'Shattering',
      description: 'Removes a buff or debuff when the skill hits.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Siphoning
  MysticEnchant(id: 'mc_siphoning', name: 'Siphoning',
      description: 'Increases the life steal of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Bolstering
  MysticEnchant(id: 'mc_bolstering', name: 'Bolstering',
      description: 'Increases the amount of damage absorbed by shields created by the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Swift
  MysticEnchant(id: 'mc_swift', name: 'Swift',
      description: 'Increases the travel speed of the skill\'s projectile.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Unstable
  MysticEnchant(id: 'mc_unstable', name: 'Unstable',
      description: 'Increases the critical strike damage multiplier of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Tenacious
  MysticEnchant(id: 'mc_tenacious', name: 'Tenacious',
      description: 'The skill cannot be dispelled or stolen.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Cleansing
  MysticEnchant(id: 'mc_cleansing', name: 'Cleansing',
      description: 'Removes a harmful effect from the target when the skill is used.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Staggering
  MysticEnchant(id: 'mc_staggering', name: 'Staggering',
      description: 'Increases the stun/snare/root duration of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Intensifying
  MysticEnchant(id: 'mc_intensifying', name: 'Intensifying',
      description: 'Increases the periodic damage of the skill over its full duration.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Surging
  MysticEnchant(id: 'mc_surging', name: 'Surging',
      description: 'Increases the initial impact damage of the skill at the cost of periodic damage.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Mending
  MysticEnchant(id: 'mc_mending', name: 'Mending',
      description: 'Increases the burst healing but reduces the heal over time portion.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Warding
  MysticEnchant(id: 'mc_warding', name: 'Warding',
      description: 'The skill grants a small damage reduction buff to the caster.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Resurgent
  MysticEnchant(id: 'mc_resurgent', name: 'Resurgent',
      description: 'If the skill kills the target, the caster heals for a small amount.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Determined
  MysticEnchant(id: 'mc_determined', name: 'Determined',
      description: 'Reduces the resource cost of the skill but slightly reduces its power.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Blazing
  MysticEnchant(id: 'mc_blazing', name: 'Blazing',
      description: 'Increases the fire damage portion of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Freezing
  MysticEnchant(id: 'mc_freezing', name: 'Freezing',
      description: 'Increases the frost damage portion of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Storming
  MysticEnchant(id: 'mc_storming', name: 'Storming',
      description: 'Increases the nature damage portion of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Radiant
  MysticEnchant(id: 'mc_radiant', name: 'Radiant',
      description: 'Increases the holy damage portion of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Shadowed
  MysticEnchant(id: 'mc_shadowed', name: 'Shadowed',
      description: 'Increases the shadow damage portion of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Arcane
  MysticEnchant(id: 'mc_arcane_me', name: 'Arcane',
      description: 'Increases the arcane damage portion of the skill.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Unyielding
  MysticEnchant(id: 'mc_unyielding', name: 'Unyielding',
      description: 'Increases the armor granted by the skill by 25%.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Flowing
  MysticEnchant(id: 'mc_flowing', name: 'Flowing',
      description: 'Decreases the global cooldown of the skill by 0.25 seconds.', tier: EnchantTier.uncommon),
  // Uncommon (Green) - Enduring
  MysticEnchant(id: 'mc_enduring', name: 'Enduring',
      description: 'Increases the maximum duration of the effect by 50%.', tier: EnchantTier.uncommon),

  // Rare (Blue) - Vigor
  MysticEnchant(id: 'mc_vigor', name: 'Vigor',
      description: 'Increases your maximum energy by 20. This enchant does not stack.', tier: EnchantTier.rare),
  // Rare (Blue) - Gale Winds
  MysticEnchant(id: 'mc_gale_winds', name: 'Gale Winds',
      description: 'Increases damage done by your Hurricane and Typhoon spells by 5%.', tier: EnchantTier.rare),
  // Rare (Blue) - Weapon Expertise
  MysticEnchant(id: 'mc_weapon_expertise', name: 'Weapon Expertise',
      description: 'Increases your expertise by 4.', tier: EnchantTier.rare),
  // Rare (Blue) - Hack and Slash
  MysticEnchant(id: 'mc_hack_and_slash', name: 'Hack and Slash',
      description: 'Increases the chance to trigger your Hack and Slash (Rogue) talent by 2%.', tier: EnchantTier.rare),
  // Rare (Blue) - Earth Shock
  MysticEnchant(id: 'mc_earth_shock', name: 'Earth Shock',
      description: 'Your Earth Shock ability deals 20% increased damage and stuns the target for 1 second.', tier: EnchantTier.rare),
  // Rare (Blue) - Vengeance
  MysticEnchant(id: 'mc_vengeance', name: 'Vengeance',
      description: 'Increases damage done by your Fireball and Frostbolt spells by 5%.', tier: EnchantTier.rare),
  // Rare (Blue) - Arcane Resilience
  MysticEnchant(id: 'mc_arcane_resilience', name: 'Arcane Resilience',
      description: 'Reduces the cooldown of your Blink spell by 2 seconds.', tier: EnchantTier.rare),
  // Rare (Blue) - Bloodthirsty
  MysticEnchant(id: 'mc_bloodthirsty', name: 'Bloodthirsty',
      description: 'Your Bloodthirst ability also heals you for 5% of your maximum health.', tier: EnchantTier.rare),
  // Rare (Blue) - Nature's Grace
  MysticEnchant(id: 'mc_natures_grace', name: "Nature's Grace",
      description: 'Your healing spells have a 10% chance to also apply a heal-over-time effect on the target.', tier: EnchantTier.rare),
  // Rare (Blue) - Soul Link
  MysticEnchant(id: 'mc_soul_link', name: 'Soul Link',
      description: 'Your Drain Life and Drain Soul spells also heal your pet for 50% of the damage dealt.', tier: EnchantTier.rare),
  // Rare (Blue) - Power Word: Fortitude
  MysticEnchant(id: 'mc_power_word_fortitude', name: 'Power Word: Fortitude',
      description: 'Your Power Word: Shield also increases the targets maximum health by 10% while active.', tier: EnchantTier.rare),
  // Rare (Blue) - Raptor Strike
  MysticEnchant(id: 'mc_raptor_strike', name: 'Raptor Strike',
      description: 'Your Raptor Strike ability deals 15% increased damage and reduces the targets movement speed.', tier: EnchantTier.rare),
  // Rare (Blue) - Thunder Clap
  MysticEnchant(id: 'mc_thunder_clap', name: 'Thunder Clap',
      description: 'Your Thunder Clap ability now also applies a 10% attack speed debuff.', tier: EnchantTier.rare),
  // Rare (Blue) - Shadowstep Mastery
  MysticEnchant(id: 'mc_shadowstep_mastery', name: 'Shadowstep Mastery',
      description: 'Your Shadowstep cooldown is reduced by 5 seconds and now grants 30% movement speed for 4 seconds.', tier: EnchantTier.rare),
  // Rare (Blue) - Crusader Strike
  MysticEnchant(id: 'mc_crusader_strike', name: 'Crusader Strike',
      description: 'Your Crusader Strike ability generates 2 Holy Power instead of 1.', tier: EnchantTier.rare),
  // Rare (Blue) - Frostbrand
  MysticEnchant(id: 'mc_frostbrand', name: 'Frostbrand',
      description: 'Your Frostbrand Weapon enchant also has a 15% chance to freeze the target for 2 seconds.', tier: EnchantTier.rare),
  // Rare (Blue) - Mana Spring
  MysticEnchant(id: 'mc_mana_spring', name: 'Mana Spring',
      description: 'Increases your maximum mana by 20. This enchant does not stack.', tier: EnchantTier.rare),
  // Rare (Blue) - Fury
  MysticEnchant(id: 'mc_fury', name: 'Fury',
      description: 'Increases the rage generation of your abilities by 5. This enchant does not stack.', tier: EnchantTier.rare),
  // Rare (Blue) - Swift Strikes
  MysticEnchant(id: 'mc_swift_strikes', name: 'Swift Strikes',
      description: 'Increases your attack speed by 3%.', tier: EnchantTier.rare),
  // Rare (Blue) - Mental Agility
  MysticEnchant(id: 'mc_mental_agility', name: 'Mental Agility',
      description: 'Reduces the mana cost of all spells by 4%. Stacks up to 2 times.', tier: EnchantTier.rare),
  // Rare (Blue) - Holy Power
  MysticEnchant(id: 'mc_holy_power', name: 'Holy Power',
      description: 'Increases Holy spell damage by 5%.', tier: EnchantTier.rare),
  // Rare (Blue) - Shadow Affinity
  MysticEnchant(id: 'mc_shadow_affinity', name: 'Shadow Affinity',
      description: 'Increases Shadow spell damage by 5%.', tier: EnchantTier.rare),
  // Rare (Blue) - Elemental Focus
  MysticEnchant(id: 'mc_elemental_focus', name: 'Elemental Focus',
      description: 'Increases Nature and Fire spell damage by 4%.', tier: EnchantTier.rare),
  // Rare (Blue) - Arcane Focus
  MysticEnchant(id: 'mc_arcane_focus', name: 'Arcane Focus',
      description: 'Increases Arcane spell damage by 5%.', tier: EnchantTier.rare),
  // Rare (Blue) - Frost Focus
  MysticEnchant(id: 'mc_frost_focus', name: 'Frost Focus',
      description: 'Increases Frost spell damage by 5%.', tier: EnchantTier.rare),
  // Rare (Blue) - Fire Focus
  MysticEnchant(id: 'mc_fire_focus', name: 'Fire Focus',
      description: 'Increases Fire spell damage by 5%.', tier: EnchantTier.rare),
  // Rare (Blue) - Melee Mastery
  MysticEnchant(id: 'mc_melee_mastery', name: 'Melee Mastery',
      description: 'Increases attack power by 15.', tier: EnchantTier.rare),
  // Rare (Blue) - Ranged Mastery
  MysticEnchant(id: 'mc_ranged_mastery', name: 'Ranged Mastery',
      description: 'Increases ranged attack power by 15.', tier: EnchantTier.rare),
  // Rare (Blue) - Spell Power
  MysticEnchant(id: 'mc_spell_power_me', name: 'Spell Power',
      description: 'Increases spell power by 12. Stacks up to 2 times.', tier: EnchantTier.rare),
  // Rare (Blue) - Toughness
  MysticEnchant(id: 'mc_toughness_me', name: 'Toughness',
      description: 'Increases maximum health by 50. Stacks up to 2 times.', tier: EnchantTier.rare),
  // Rare (Blue) - Critical Strike
  MysticEnchant(id: 'mc_critical_strike', name: 'Critical Strike',
      description: 'Increases your critical strike chance by 1%.', tier: EnchantTier.rare),
  // Rare (Blue) - Haste
  MysticEnchant(id: 'mc_haste_me', name: 'Haste',
      description: 'Increases your haste by 1%.', tier: EnchantTier.rare),
  // Rare (Blue) - Hit Rating
  MysticEnchant(id: 'mc_hit_rating', name: 'Hit Rating',
      description: 'Increases your hit chance by 1%.', tier: EnchantTier.rare),
  // Rare (Blue) - Dodge
  MysticEnchant(id: 'mc_dodge_me', name: 'Dodge',
      description: 'Increases your dodge chance by 1%.', tier: EnchantTier.rare),
  // Rare (Blue) - Parry
  MysticEnchant(id: 'mc_parry_me', name: 'Parry',
      description: 'Increases your parry chance by 1%.', tier: EnchantTier.rare),
  // Rare (Blue) - Block
  MysticEnchant(id: 'mc_block_me', name: 'Block',
      description: 'Increases your block chance by 1%.', tier: EnchantTier.rare),
  // Rare (Blue) - Resilience
  MysticEnchant(id: 'mc_resilience', name: 'Resilience',
      description: 'Increases resilience by 3. Reduces critical damage taken by 1%.', tier: EnchantTier.rare),

  // Epic (Purple) - Defensive Magic
  MysticEnchant(id: 'mc_defensive_magic', name: 'Defensive Magic',
      description: 'Your body and mind move as one, allowing you to dodge, parry and block attacks while casting. This effect does not work against players.', tier: EnchantTier.epic),
  // Epic (Purple) - Mass Hysteria
  MysticEnchant(id: 'mc_mass_hysteria', name: 'Mass Hysteria',
      description: 'Your Fear spell transforms into Fear (Mass Hysteria), becoming empowered with dark and terrifying energy, causing enemies near your feared target to become Shaken, reducing their stats by 5% and movement speed by 25%.', tier: EnchantTier.epic),
  // Epic (Purple) - Flurry of Steel
  MysticEnchant(id: 'mc_flurry_of_steel', name: 'Flurry of Steel',
      description: 'Your Bladestorm now hits with both weapons.', tier: EnchantTier.epic),
  // Epic (Purple) - Hailstorm
  MysticEnchant(id: 'mc_hailstorm', name: 'Hailstorm',
      description: 'Your Blizzard is transformed into Blizzard (Halestorm), giving it a cast time instead of a channel.', tier: EnchantTier.epic),
  // Epic (Purple) - Echo of the Elements
  MysticEnchant(id: 'mc_echo_elements', name: 'Echo of the Elements',
      description: 'Your Lava Burst has a 30% chance to cast a second time for free at your current location.', tier: EnchantTier.epic),
  // Epic (Purple) - Shadowweave
  MysticEnchant(id: 'mc_shadowweave', name: 'Shadowweave',
      description: 'Your Mind Flay applies Shadowweave, increasing Shadow damage taken by 10% for 8 seconds.', tier: EnchantTier.epic),
  // Epic (Purple) - Divine Aegis
  MysticEnchant(id: 'mc_divine_aegis', name: 'Divine Aegis',
      description: 'Your critical heals create a shield absorbing damage equal to 30% of the heal amount for 12 seconds.', tier: EnchantTier.epic),
  // Epic (Purple) - Sudden Death
  MysticEnchant(id: 'mc_sudden_death', name: 'Sudden Death',
      description: 'Your Execute ability can be used on any target, dealing 50% increased damage to targets above 20% health.', tier: EnchantTier.epic),
  // Epic (Purple) - Lock and Load
  MysticEnchant(id: 'mc_lock_and_load', name: 'Lock and Load',
      description: 'Your Arcane Shot has a 20% chance to make your next Explosive Shot cost no Focus and have no cooldown.', tier: EnchantTier.epic),
  // Epic (Purple) - Malygiss Fury
  MysticEnchant(id: 'mc_malygiss_fury', name: "Malygos's Fury",
      description: 'Your Arcane Blast and Arcane Missiles cost 25% less mana but deal 15% reduced damage to players.', tier: EnchantTier.epic),
  // Epic (Purple) - Bloodworms
  MysticEnchant(id: 'mc_bloodworms', name: 'Bloodworms',
      description: 'Your Blood Strike has a 20% chance to summon a Bloodworm that attacks your target and heals you.', tier: EnchantTier.epic),
  // Epic (Purple) - Savage Roar
  MysticEnchant(id: 'mc_savage_roar', name: 'Savage Roar',
      description: 'Your Shred and Ferocious Bite abilities deal 20% increased damage while in Cat Form.', tier: EnchantTier.epic),
  // Epic (Purple) - Way of the Monk
  MysticEnchant(id: 'mc_way_mono', name: 'Way of the Monk',
      description: 'Your Tiger Palm ability now also grants you a 15% dodge chance for 6 seconds.', tier: EnchantTier.epic),
  // Epic (Purple) - Windwalk
  MysticEnchant(id: 'mc_windwalk', name: 'Windwalk',
      description: 'Your Ghost Wolf form grants 40% increased movement speed and immunity to roots and snares.', tier: EnchantTier.epic),
  // Epic (Purple) - Vanquished
  MysticEnchant(id: 'mc_vanquished', name: 'Vanquished',
      description: 'Your Death Coil has a 15% chance to fear the target for an additional 3 seconds.', tier: EnchantTier.epic),
  // Epic (Purple) - Improved Scorch
  MysticEnchant(id: 'mc_imp_scorch', name: 'Improved Scorch',
      description: 'Your Scorch deals 50% increased damage and reduces the target\'s armor by 5 for 8 seconds.', tier: EnchantTier.epic),
  // Epic (Purple) - Improved Moonfire
  MysticEnchant(id: 'mc_imp_moonfire', name: 'Improved Moonfire',
      description: 'Your Moonfire duration is increased by 6 seconds and deals 25% more damage.', tier: EnchantTier.epic),
  // Epic (Purple) - Improved Judgement
  MysticEnchant(id: 'mc_imp_judgement', name: 'Improved Judgement',
      description: 'Your Judgement range is increased by 20 yards and deals 30% increased damage.', tier: EnchantTier.epic),
  // Epic (Purple) - Backstab Mastery
  MysticEnchant(id: 'mc_backstab_mastery', name: 'Backstab Mastery',
      description: 'Your Backstab deals 30% more damage and generates 5 extra energy.', tier: EnchantTier.epic),
  // Epic (Purple) - Holy Fire Transformed
  MysticEnchant(id: 'mc_holy_fire_transformed', name: 'Holy Fire Transformed',
      description: 'Your Holy Fire no longer deals damage over time, but instead deals all damage instantly.', tier: EnchantTier.epic),
  // Epic (Purple) - Chain Heal Transformed
  MysticEnchant(id: 'mc_chain_heal_transformed', name: 'Chain Heal Transformed',
      description: 'Your Chain Heal bounces 2 extra times and each bounce heals for 10% more.', tier: EnchantTier.epic),
  // Epic (Purple) - Arcane Missiles Transformed
  MysticEnchant(id: 'mc_arcane_missiles_transformed', name: 'Arcane Missiles Transformed',
      description: 'Arcane Missiles now fires 3 additional bolts and can move while casting.', tier: EnchantTier.epic),
  // Epic (Purple) - Shadow Bolt Transformed
  MysticEnchant(id: 'mc_shadow_bolt_transformed', name: 'Shadow Bolt Transformed',
      description: 'Shadow Bolt is instant cast but costs 30% more mana.', tier: EnchantTier.epic),
  // Epic (Purple) - Lightning Bolt Transformed
  MysticEnchant(id: 'mc_lightning_bolt_transformed', name: 'Lightning Bolt Transformed',
      description: 'Lightning Bolt chains to 2 additional targets for 50% damage.', tier: EnchantTier.epic),
  // Epic (Purple) - Shield Slam Transformed
  MysticEnchant(id: 'mc_shield_slam_transformed', name: 'Shield Shield Slam Transformed',
      description: 'Shield Slam hits all enemies in front of you and generates 10 extra threat.', tier: EnchantTier.epic),
  // Epic (Purple) - Whirlwind Transformed
  MysticEnchant(id: 'mc_whirlwind_transformed', name: 'Whirlwind Transformed',
      description: 'Whirlwind no longer has a cooldown and hits in a 12 yard radius.', tier: EnchantTier.epic),

  // Legendary (Orange) - Soulbender
  MysticEnchant(id: 'mc_soulbender', name: 'Soulbender',
      description: 'Drain Soul accumulates Soul Energy. You can consume stacks of Soul Energy with Shadowburn to heal nearby allies.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Tools Of War
  MysticEnchant(id: 'mc_tools_of_war', name: 'Tools Of War',
      description: 'Each unique direct damage Physical ability grants you a stack of Tools of War, increasing your Physical damage by 3% (2% against players), stacking 10 times. Any Non-physical damage resets all stacks.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Locust Ranger
  MysticEnchant(id: 'mc_locust_ranger', name: 'Locust Ranger',
      description: 'Teaches you Locust Shot if you know Steady Shot. Locust Shot deals nature damage based on your ranged weapon damage, scales with Steady Shot modifiers and is increased by your spell damage. This ability is castable while moving. When it deals non-critical damage it triggers Wild Quiver (requires rank 3 of the Wild Quiver talent). When it deals critical damage, it reduces the cool-down of your Chimera Shot by 2 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Soul of The Warden
  MysticEnchant(id: 'mc_soul_of_the_warden', name: 'Soul of The Warden',
      description: 'Teaches you Fan of Knives Ability. Increases the effect of your Deadly Throw ability by 10%. Reduces the cool-down of your Blink ability by 50% while out of combat.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Martial Crescendo
  MysticEnchant(id: 'mc_martial_crescendo', name: 'Martial Crescendo',
      description: 'Each unique direct damage Physical ability grants you a stack of Martial Crescendo, increasing your Attack Speed by 5%, stacking 10 times. Any Non-physical damage resets all stacks.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Titanic Mutilate
  MysticEnchant(id: 'mc_titanic_mutilate', name: 'Titanic Mutilate',
      description: 'While Titan\'s Grip is active, you learn Mutilate (Titanic Mutilate), an attack with both weapons dealing 80% weapon damage, increased by 20% if your target is bleeding. Also, your Bloodthirst deals 5% more damage per active combo point and dealing damage with Whirlwind triggers Bloodrage (if known).', tier: EnchantTier.legendary),
  // Legendary (Orange) - Guerilla Trapper
  MysticEnchant(id: 'mc_guerilla_trapper', name: 'Guerilla Trapper',
      description: 'Teaches you Barbed Snare Trap, which can be deployed from a distance. This trap slows and applies a bleed effect to the target. Your Concussive Shot now also attaches a rope to enemy targets. If the target is a player it pulls them toward you after a 2 second delay. If you lure an enemy afflicted by your Concussive Shot into your Barbed Snare Trap they will be severely wounded, causing bonus damage and stunning for 3 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Unbounded Deathbringer
  MysticEnchant(id: 'mc_unbounded_deathbringer', name: 'Unbounded Deathbringer',
      description: 'Your damaging abilities have a chance to drain the life force of your target and his nearby allies, dealing additional Shadow damage and returning a portion of it to you. This effect scales with your Drain Life ability.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Purification By Light
  MysticEnchant(id: 'mc_purification_by_light', name: 'Purification By Light',
      description: 'Your damaging abilities have a chance to Exorcise your target, leaving an ray of light causing Holy damage at the target\'s location. These effects scale with your Exorcism and Consecration abilities.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Undaunted
  MysticEnchant(id: 'mc_undaunted', name: 'Undaunted',
      description: 'Your Last Stand now reduces the damage stored in your current Stagger effect to zero, but its health bonus is reduced to 10%. Activating Last Stand allows the use of Victory Rush, and using Victory Rush while Stagger from Tactical Mastery capstone is active reduces the cool-down of your Last Stand by 40 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Unchained
  MysticEnchant(id: 'mc_unchained', name: 'Unchained',
      description: 'Reduces the cool-down of your Blink spell by 5 seconds and makes it bind nearby enemies to the matter around them, preventing them from moving for 2 seconds. You also learn an alternative way of Blinking by harnessing the Arcane to propel you through space. You are only able to do this while casting an Arcane spell and it shares a cool-down with your normal Blink, but will not interrupt your spell cast.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Unbounded Spell Slinger
  MysticEnchant(id: 'mc_unbounded_spell_slinger', name: 'Unbounded Spell Slinger',
      description: 'Your damaging abilities have a chance to strike your opponent and his nearby allies with arcane magic, dealing additional Arcane damage and triggering the Lesser Clearcasting effect.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Amal'thazad's Curse
  MysticEnchant(id: 'mc_amalthazads_curse', name: 'Amal\'thazad\'s Curse',
      description: 'Your damaging abilities have a chance to call forth Amal\'thazad\'s Curse, chilling yourself but granting you 1% critical strike chance per stack. Amal\'thazad\'s Curse also deals frost damage to your target and chills enemies near the target, reducing their movement speed by 5%, stacking 5 times.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Seething Flames
  MysticEnchant(id: 'mc_seething_flames', name: 'Seething Flames',
      description: 'Your damaging abilities have a chance to ignite enemies, dealing Fire damage to your target and his nearby allies over time. This effect scales with your Explosive Shot ability.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Holy Supernova
  MysticEnchant(id: 'mc_holy_supernova', name: 'Holy Supernova',
      description: 'Your Holy Nova is transformed into Holy Supernova, giving it a 45 second cool-down, a knock back effect on enemies, and a cleanse effect for allies.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Aimed Explosive Shot
  MysticEnchant(id: 'mc_aimed_explosive_shot', name: 'Aimed Explosive Shot',
      description: 'Your Explosive Shot is transformed into Explosive Shot (Aimed), making it a targeted spell and giving it an area of effect application.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Zany Zealot
  MysticEnchant(id: 'mc_zany_zealot', name: 'Zany Zealot',
      description: 'Your offensive Priest spell casts have a chance to cast an additional random Priest spell for free.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Crazy Cultist
  MysticEnchant(id: 'mc_crazy_cultist', name: 'Crazy Cultist',
      description: 'Your offensive Warlock spell casts have a chance to cast an additional random Warlock spell for free.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Deranged Druid
  MysticEnchant(id: 'mc_deranged_druid', name: 'Deranged Druid',
      description: 'Your offensive Druid spell casts have a chance to cast an additional random Druid spell for free.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Eccentric Elementalist
  MysticEnchant(id: 'mc_eccentric_elementalist', name: 'Eccentric Elementalist',
      description: 'Your offensive Shaman spell casts have a chance to cast an additional random Shaman spell for free.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Guardians of the Grove
  MysticEnchant(id: 'mc_guardians_of_the_grove', name: 'Guardians of the Grove',
      description: 'Your Treants now heal your allies instead of dealing damage. These Treants will not heal you if you are above 90%. But have their health reduced by 66%. Your treants will use your known Druid healing spells, but will not use channeled spells.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Words of Healing
  MysticEnchant(id: 'mc_words_of_healing', name: 'Words of Healing',
      description: 'Your Borrowed Time now also increases the critical strike chance of your direct healing spells by 20% while active. In addition, Borrowed Time is no longer consumed by spell casting.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Dominant Word: Shield
  MysticEnchant(id: 'mc_dominant_word_shield', name: 'Dominant Word: Shield',
      description: 'Your Power Word: Shield now absorbs 250% of its normal value when used on a target below 75% health. The additional absorb effect lasts for 5 seconds and reduces the cool-down of your Power World: Shield by 1 second. In addition, the mana returned to you from your Rapture is increased by 100%.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Astral Tempest
  MysticEnchant(id: 'mc_astral_tempest', name: 'Astral Tempest',
      description: 'You gain a stack of Overloaded when dealing direct Nature or Arcane Damage. Upon reaching 20 stacks of Overloaded, you will trigger an Astral Tempest on your target. This spell deals Astral Damage to all nearby enemies over 8 seconds and increases the magic damage you deal by 5% for 8 seconds. Astral Damage is a combination of the Arcane and Nature schools, and will benefit from the highest modifier to either school.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Atonement
  MysticEnchant(id: 'mc_atonement', name: 'Atonement',
      description: 'Dealing direct damage with Smite, Holy Fire or Penance now also heals nearby allies affected by your Grace for 25% of the damage dealt. This effect may not heal the caster and is reduced by 50% when damaging players.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Druid of Rot: Call of Fungarians
  MysticEnchant(id: 'mc_druid_of_rot_call_of_fungarians', name: 'Druid of Rot: Call of Fungarians',
      description: 'Your Force of Nature Spell is transformed into Force of Nature (Call Fungarians), causing it to summon Fungarians instead of Treants.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Benevolent Crusader
  MysticEnchant(id: 'mc_benevolent_crusader', name: 'Benevolent Crusader',
      description: 'When you cast a direct Holy heal on an ally that does not over-heal, you will be granted a stack of Benevolent Crusader. Benevolent Crusader stacks up to 5 times, and decreases the cast times of your Penance, Holy Fire, and Smite abilities by 12% per stack.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Battlemage
  MysticEnchant(id: 'mc_battlemage', name: 'Battlemage',
      description: 'Your Warrior abilities now have a chance to trigger either Arcane Barrage, Fire Blast, or Ice Lance. These abilities deal 20% less damage to players. You must know one of these spells to trigger them.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Growing Light
  MysticEnchant(id: 'mc_growing_light', name: 'Growing Light',
      description: 'When cast on your Beacon of Light, Holy Light also heals up to 5 friendly targets within 8 yards of the Beacon of for an additional 20%. It also infuses you with Growing Light, increasing the healing transferred to your Beacon of Light by an additional 20% for 6 seconds, stacking up to 3 times. Casting Holy Light on your Beacon of Light also extends its duration by 10 seconds and reduces the targets physical damage taken by 10% for 10 seconds. This effect does not stack with other similar effects.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Time Warp
  MysticEnchant(id: 'mc_time_warp', name: 'Time Warp',
      description: 'After casting Blink your spell damage, spell haste, and spell critical chance is increased by 5% for 6 seconds. You will also learn to create a Time Warp, allowing you to return to your original Blink position if cast within 4 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Blooming Growth
  MysticEnchant(id: 'mc_blooming_growth', name: 'Blooming Growth',
      description: 'Your Regrowth criticals apply its heal over time effect to up to 5 party and raid members within 8 yards.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Total Eclipse
  MysticEnchant(id: 'mc_total_eclipse', name: 'Total Eclipse',
      description: 'Gaining Eclipse triggers your Owlkin Frenzy rank 3 talent and makes your next Wrath or Starfire apply an additional effect: * After gaining Solar Eclipse, Wrath will apply Entangling Roots for 6 sec to players or Insect Swarm to monsters. This Entangling Roots effect does not trigger any additional effects. * After gaining Lunar Eclipse, Starfire will apply a 2 second stun to players or Moonfire to monsters. You must know these spells in order to trigger them.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Nature's Fervor
  MysticEnchant(id: 'mc_natures_fervor', name: 'Nature\'s Fervor',
      description: 'When you fully apply Lacerate to a target, your next Feral ability becomes empowered: Mangle (Bear): Reduces the target\'s armor by 20% for 12 seconds. Faerie Fire (Feral): Reduces your physical damage taken by 10% for 8 seconds. Lacerate: Next application deals 75% increased direct damage and 100% increased threat.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Deadly Bite
  MysticEnchant(id: 'mc_deadly_bite', name: 'Deadly Bite',
      description: 'Your Mongoose Bite and Counterattack abilities applies a bleed effect to the target for 8 seconds which stacks 5 times. This effect also increases the damage the target takes from your Raptor Strike by 15%.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Flame On!
  MysticEnchant(id: 'mc_flame_on', name: 'Flame On!',
      description: 'Your damaging Fireball, Scorch, and Flamestrike casts increase the critical strike chance by 33% and the damage done by 15% (5% to players) of your next Fire Blast by 33% for 8 seconds, stacking up to 3 times. In addition, increases the range of your Fire Blast by 5 yards.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Ice Barrage
  MysticEnchant(id: 'mc_ice_barrage', name: 'Ice Barrage',
      description: 'Your successful Frostbolt casts have a 15% chance to launch an Ice Lance at the target and you gain 5% increased chance to trigger your Fingers of Frost effect. Also, your Ice Lance deals 50% more damage on frozen targets higher level than you.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Consecrated Strikes
  MysticEnchant(id: 'mc_consecrated_strikes', name: 'Consecrated Strikes',
      description: 'Your Crusader Strike, Divine Storm and Hammer of the Righteous abilities have a chance to consecrate the ground beneath your feet. Consecrated Ground deals Holy damage every second to your enemies, increases the Strength of your allies by 5% and increases your Strength by 10% and your spell damage by 30% of your Strength. Consecrated Ground will also imbue your weapon with pure light, giving your melee abilities a chance to deal additional physical damage. This damage can trigger your Seal of Command. Does not stack with other temporary weapon enchants.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Shadow Visions
  MysticEnchant(id: 'mc_shadow_visions', name: 'Shadow Visions',
      description: 'Dealing damage with Mind Flay grants you a Soul Fragment. Soul Fragments grant you 1% increased casting speed for 12 sec, stacking up to 9 times. Upon reaching 9 stacks you gain Shadow Visions for the next 8 seconds. Shadow Visions empowers your next ability: Shadow Word: Pain - Afflicts up to 3 additional nearby enemies. Costs no mana. Mind Blast - Causes the target to take 5% more Shadow damage from you for 10 seconds. Devouring Plague - Reduces the periodic interval by 33%.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Festering Wound
  MysticEnchant(id: 'mc_festering_wound', name: 'Festering Wound',
      description: 'Your Mutilate criticals increase the damage the target takes from your Rogue poisons by 2% for 12 seconds. This effect stacks 10 times. Mutilate critical strikes also restore 15 energy.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Booming  Thunder
  MysticEnchant(id: 'mc_booming__thunder', name: 'Booming  Thunder',
      description: 'Your damaging Lightning Bolt and Chain Lightning spells grant you a stack of Booming Thunder, stacking up to 20 times. Each stack empowers your Earth Shock, increasing its damage by 15% (6% to players) and critical strike chance by 3%.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Molten Earth
  MysticEnchant(id: 'mc_molten_earth', name: 'Molten Earth',
      description: 'Your Lava Lashes increase your bonus spell damage by 10% of your attack power and leave a patch of fire on the ground which deals fire damage to all enemies within. This effect scales with your Fire Nova ability.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Mending  Tide
  MysticEnchant(id: 'mc_mending__tide', name: 'Mending  Tide',
      description: 'Your Riptide create a healing effect at the feet of the target ally. All allies standing within will be healed every 2 seconds for 6 seconds, and Chain Heals cast on these targets will be 15% more powerful.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Demonic Influence
  MysticEnchant(id: 'mc_demonic_influence', name: 'Demonic Influence',
      description: 'After entering Metamorphosis your summoned demons deal 50% additional damage and they generate 3000 mana over 30 seconds. In addition your Metamorphosis cool-down is reduced by 50% but the bonus armor is reduced to 90%, and you no longer benefit from reduced chance to be critically hit or reduced duration of stuns and snares.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Wild Felfire
  MysticEnchant(id: 'mc_wild_felfire', name: 'Wild Felfire',
      description: 'Your Chaos Bolt spawns a Rain of Fire-like effect above the target. In addition, your Chaos Bolt has a 10% increased chance to critically strike and will dispel the player casted absorbs on the target hit.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Righteous Flames
  MysticEnchant(id: 'mc_righteous_flames', name: 'Righteous Flames',
      description: 'Your non-periodic Fire damage is increased by 1% for each charge of Inner Fire but the charges granted by Inner Fire is reduced by 50%. Dealing non-periodic Fire damage consumes a charge of Inner Fire. Consuming a charge this way will grant a stack of Righteous Flames, increasing the damage of your next Holy Fire by 8%, stacking up to five times. Upon reaching max stacks, your next Holy Fire will deal Radiant Damage to 5 targets within 8 yards and restore your Inner Fire to max charges. Radiant Damage is a combination of Fire and Holy schools, and will benefit from the highest modifier to either school.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Assuaging Shadows
  MysticEnchant(id: 'mc_assuaging_shadows', name: 'Assuaging Shadows',
      description: 'Shadow Dance now triggers a Shadow Nova which slows all targets within 8 yards by 80% for 3 sec and applies 1 Shadow Mark (5 to creatures) to them for 8 sec. When you Ambush a marked target your Shadowstep cool-down is refreshed, a Shadow Mark stack is removed, and you gain Shadow\'s Embrace. Shadow\'s Embrace increases all damage you deal by 4%, stacking up to 5 times, and lasts 15 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Warcry
  MysticEnchant(id: 'mc_warcry', name: 'Warcry',
      description: 'Your Battle Shout also increases your melee and ranged critical strike chance by 100% for 4 seconds. This effect has a 2 minute cool-down.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Overflow
  MysticEnchant(id: 'mc_overflow', name: 'Overflow',
      description: 'Your Healing Touch overflows and also heals the lowest percentage health friendly party or raid target within 8 yards for 20% of the amount healed. In addition, Healing Touch can now trigger Living seed also on non-criticals.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Pure Shadow
  MysticEnchant(id: 'mc_pure_shadow', name: 'Pure Shadow',
      description: 'Your Shadow Bolt casts draw power from your enemies, increasing the critical strike chance of your Shadow spells by 1%, stacking up to 10 times. When fully stacked, your Shadowfury will send pure Shadow crashing down at the target area, dealing massive Shadow damage spread between affected enemies.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Whispers of the Old Gods
  MysticEnchant(id: 'mc_whispers_of_the_old_gods', name: 'Whispers of the Old Gods',
      description: 'Damage from your Shadow Word: Pain spell has a chance to summon a Tentacle of the Old Gods which will wreak havoc on your enemies and increase your spell power by 15% of your Spirit.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Ice Lash
  MysticEnchant(id: 'mc_ice_lash', name: 'Ice Lash',
      description: 'Your Lava Lash is transformed into Ice Lash, dealing Frost damage and increasing the damage of your Frostbolt and Ice Lance based on your attack power. If cast while Fingers of Frost is active, Ice Lash is guaranteed to critically hit and restore your Fingers of Frost charges.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Deathbringer
  MysticEnchant(id: 'mc_deathbringer', name: 'Deathbringer',
      description: 'Your damaging abilities have a chance to drain the life force of your target, dealing a significant amount of additional Shadow damage and returning a portion of it to you. This powerful effect scales with your Drain Life ability. This powerful effect cannot occur more than once every 4.5 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Righteous Zealot
  MysticEnchant(id: 'mc_righteous_zealot', name: 'Righteous Zealot',
      description: 'Your damaging abilities have a chance to Smite your target, dealing a significant amount of additional Holy damage and healing nearby party members for a small amount. This powerful effect scales with your Smite ability. Damage reduced by 80% against players. This powerful effect cannot occur more than once every 4.5 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Spell Slinger
  MysticEnchant(id: 'mc_spell_slinger', name: 'Spell Slinger',
      description: 'Your damaging abilities have a chance to strike your opponent with arcane magic, dealing a significant amount of additional Arcane damage and triggering the Clearcasting effect. This powerful effect cannot occur more than once every 10 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Frost Lich
  MysticEnchant(id: 'mc_frost_lich', name: 'Frost Lich',
      description: 'Your damaging abilities have a chance to chill your target, dealing Frost damage and slowing the target by 50% for 4 seconds. This effect cannot occur more than once every 9 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Harbinger of Flame
  MysticEnchant(id: 'mc_harbinger_of_flame', name: 'Harbinger of Flame',
      description: 'Your damaging abilities have a chance to ignite enemies, dealing a significant amount of Fire damage to your target and enemies within 8 yards and setting them ablaze, dealing additional Fire damage over 4 seconds and increasing your Fire damage done to the targets by 3%. This powerful effect cannot occur more than once every 5 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Predator's Wrath
  MysticEnchant(id: 'mc_predators_wrath', name: 'Predator\'s Wrath',
      description: 'Your Predatory Strikes effect now lets you cast Wrath without leaving Cat Form. Wraths cast this way are unable to miss or crit, restore 30 energy and 15% of your base mana, and gives you Predator\'s Wrath. Predator\'s Wrath causes all your Cat Form abilities to deal additional Nature damage, this effect lasts for 6 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Fury of the Titans
  MysticEnchant(id: 'mc_fury_of_the_titans', name: 'Fury of the Titans',
      description: 'Your maximum rage is increased to 300. You learn Titanic Strike, a finishing move that strikes with both of your weapons. When used at full rage, Titanic Strike makes you go into a Titanic Fury, increasing your physical damage dealt with all attacks by 20% (5% against players), removing all rage costs and making your auto-attacks generate Combo Points for 10 seconds. When this effect ends, your rage is lost. Requires Titan\'s Grip.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Carnage Incarnate
  MysticEnchant(id: 'mc_carnage_incarnate', name: 'Carnage Incarnate',
      description: 'Transforms your Rend into Rend (Carnage), which is usable in Bear Form. Taste for Blood now empowers your next Swipe to generate additional threat and draw blood from all enemies hit, stacking up to 12 times. Rend (Carnage) ticks also have a chance to draw blood. If you get hit below 50% health, you will consume some of this blood to heal yourself. This effect can only occur once every 10 seconds. If you reach max stacks you become Carnage Incarnate, encasing yourself in a shield of your enemies\' blood and bones that protect you from damage, heal you and damage all nearby enemies.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Twilight Paragon
  MysticEnchant(id: 'mc_twilight_paragon', name: 'Twilight Paragon',
      description: 'Dealing damage with Smite and Holy Fire grants you Paragon of Light, increasing your critical strike chance by 1%, stacking up to 10 times. But darkness lurks within... Casting Exorcism reveals your true form, consuming the stacks to inflict massive Twilight damage and making you a Paragon of Darkness for 1 second per stack consumed. While active your Mind Flay is empowered and deals additional Twilight damage. Twilight damage is a combination of the Shadow and Holy schools, and will benefit from the highest modifier to either school.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Demolisher
  MysticEnchant(id: 'mc_demolisher', name: 'Demolisher',
      description: 'Your Mortal Strike is transformed into Demolishing Strike, an ability that deals 150% weapon damage and scales with Mortal Strike modifiers. In addition, it demolishes the target\'s defenses, increasing the physical damage they take from your attacks by 1%. Demolish stacks up every time the target is critically hit in melee, and upon reaching 10 stacks empowers your next ability: Expose Armor: Reduces the targets\' armor by an additional 10% and increases your armor penetration by 20% for 20 seconds. Riposte: Generates 2 additional combo points and slows the targets attack speed by an additional 10%. Mongoose Bite: Doesn\'t trigger its cool-down and is guaranteed to critically strike.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Mana Fiend
  MysticEnchant(id: 'mc_mana_fiend', name: 'Mana Fiend',
      description: 'Increases your Intellect by 25% and makes your Arcane direct damage spells replace your next melee auto-attack with an attack that consumes mana to deal Arcane damage. Dealing damage this way has a 50% chance to make you go into a Mana-crazed Delirium, increasing your arcane spell power by 10% of your Intellect, stacking up every second. While active your Arcane spells cost no mana, but maintaining the effect prevents you from gaining mana from other sources and drains your mana every second. When you drop below 20% mana the Delirium ends. The mana drained is restored to you over 12 seconds as you come back to your senses.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Evoker
  MysticEnchant(id: 'mc_evoker', name: 'Evoker',
      description: 'Casting Arcane Missiles while Missile Barrage is active increases the chance to proc your next Brain Freeze by 50%. Casting Fireball while Brain Freeze is active increases the chance to proc your next Missile Barrage by 50%. Consuming these effects grant you a stack of Evoker which decreases the cast time of Frostbolt by 3%, increases the damage by 3% and critical strike chance by 2% of Fireball and Arcane Missiles. This effect stacks to 5 times.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Blood And Guts
  MysticEnchant(id: 'mc_blood_and_guts', name: 'Blood And Guts',
      description: 'Transforms your Eviscerate into Eviscerate (Disembowel), a finishing move that uses a Dagger to make a swift incision, causing your target to take bleed damage over 6 seconds. This damage scales with modifiers to Eviscerate and can critically strike. Your Mutilate deals bonus damage against Disemboweled targets. Casting Execute attempts to finish the target off, consuming Disembowel to deal bonus damage and triggering Remorseless Attacks (if known).', tier: EnchantTier.legendary),
  // Legendary (Orange) - Holy Penance
  MysticEnchant(id: 'mc_holy_penance', name: 'Holy Penance',
      description: 'Healing with Penance leaves a lingering Holy Spirit on the target, increasing the healing and critical effect chance of your next Holy Shock on the target by 15%, stacking up to 4 times. In addition, effective healing with Holy Light reduces the cool-down of Penance by 3 second, and Penance now channels for 1 extra second, shooting and extra volley of light.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Stormhammer
  MysticEnchant(id: 'mc_stormhammer', name: 'Stormhammer',
      description: 'Your Concussion Blow is transformed into Concussion Blow (Stormhammer), an attack with 15 yard range that deals Nature damage. This attack does not stun the target, but increases your spell damage by 30% of your Stamina and reduces your physical damage taken by 10% for 8 seconds. Dealing damage with Thunder Clap empowers your Lightning Bolt and Chain Lightning for 8 seconds, increasing their threat by 100% and making them reduce the cool-down of Concussion Blow (Stormhammer) by 8 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Champion Of Justice
  MysticEnchant(id: 'mc_champion_of_justice', name: 'Champion Of Justice',
      description: 'Dealing damage with Judgement or Crusader Strike increases your Holy healing power by 10% of your Strength for 15 seconds, stacking up to 3 times. When fully stacked, effectively healing an ally triggers a bonus heal and adorns them for 15 seconds. While active, your damaging melee abilities restore 5% of base mana to you and heals targetes you have adorned.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Shadow Counter
  MysticEnchant(id: 'mc_shadow_counter', name: 'Shadow Counter',
      description: 'If you know Shadowstep you learn a more advanced form of this magic: Shadow Warp. This spell envelops the caster in shadows for up to 2 seconds. While channeling, the caster is immune to any effects that would cause them to lose control of their actions. If struck by a direct damage attack while active, the shadows absorb the hit, harnessing the energy to Shadowstep to the attacker and making them take 10% increased damage from your attacks for 3 seconds. This ability is affected by modifiers to Shadowstep and shares an irreducable 20 second cool-down with Shadowstep, Feral Charge, Intercept and Intervene. It only works against players.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Temporal Shift
  MysticEnchant(id: 'mc_temporal_shift', name: 'Temporal Shift',
      description: 'Teaches you Temporal Blast, a casted spell dealing Arcane damage to the target and reducing the cast time of your next other direct damaging spell by 40%. Cancelling a Temporal Blast before it finishes stores the time invested into the cast, reducing the cast time of your next Temporal Blast by the same amount. Temporal Blast damage scales with modifiers to Arcane Blast.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Unbounded Drain Life
  MysticEnchant(id: 'mc_unbounded_drain_life', name: 'Unbounded Drain Life',
      description: 'Your Drain Life is transformed into Drain Life (Unbounded Drain Life), giving it a conal targetting type.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Master Of Shadows
  MysticEnchant(id: 'mc_master_of_shadows', name: 'Master Of Shadows',
      description: 'Your Sinister Strike, Eviscerate, Garrote, and Rupture now deal extra Shadow damage, scaling with your spell damage. Your Sinister Strike criticals grant you Apprentice of Shadows, increasing your spell haste by 8% and your Shadow spell damage by 20% of your Agility for 8 sec, stacking up to 3 times. When fully stacked, your Eviscerate or Rupture consume Apprentice of Shadows to increase your Shadow spell damage by 60% of your Agility and increase your Shadow damage done and your Shadow spell critical strike chance by 10% for 10 sec.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Prophet Of Wrath
  MysticEnchant(id: 'mc_prophet_of_wrath', name: 'Prophet Of Wrath',
      description: 'Your Arcane Blast and Arcane Missiles increase the duration of Divine Illumination by 0.5 seconds each time they damage an enemy. Your Smite and Holy Fire spells reduce the cool-down of Divine Illumination by 6 seconds. While Divine Illumination is active, Arcane Blast and Arcane Missiles are infused with Holy power, causing them to deal Divine damage. Divine damage is a combination of the Arcane and Holy schools, and will benefit from the highest modifier to either school.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Hot Hands
  MysticEnchant(id: 'mc_hot_hands', name: 'Hot Hands',
      description: 'Increases your spell critical strike chance by 3% on targets affected by your Living Bomb. Your Hot Streak can now trigger from Pyroblast.', tier: EnchantTier.legendary),
  // Legendary (Orange) - By Fire Be Purged
  MysticEnchant(id: 'mc_by_fire_be_purged', name: 'By Fire Be Purged',
      description: 'Your Fire Nova will now purge all enemies hit by the blast, removing a beneficial spell effect. This effect can only trigger once every 20 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - One With The Light
  MysticEnchant(id: 'mc_one_with_the_light', name: 'One With The Light',
      description: 'Deep spiritual unity allows you to transcend the physical plane. Your Physical damage done is halved but your Holy spell damage is increased by 30% of your Strength. Crusader Strike and Divine Storm now also deal Holy damage and scale with your Holy spell damage.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Compound Power
  MysticEnchant(id: 'mc_compound_power', name: 'Compound Power',
      description: 'Your successful Steady Shots and Arcane Shots now award a combo point, and Slice and Dice now also increases your Ranged Attack Speed. If you know Aimed Shot, you will now also learn Compound Shot, which consumes your combo points to fire an empowered Aimed Shot. This ability scales with your Aimed Shot ability, and also shares a cool-down with it.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Social Distancing
  MysticEnchant(id: 'mc_social_distancing', name: 'Social Distancing',
      description: 'You gain 20% disease resistance while no other player is within 6 yards of you.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Double Down
  MysticEnchant(id: 'mc_double_down', name: 'Double Down',
      description: 'Your Sinister Strike now hits with both weapons, but no longer generates combo points. Does not work with Titan\'s Grip.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Bulwark
  MysticEnchant(id: 'mc_bulwark', name: 'Bulwark',
      description: 'Your Shield Block is replaced with an improved, channeled version. While active, you will Shield Slam nearby enemies every second and the damage reduction effect of your Critical Block is increased by 8%. Channeling reduces your movement speed by 50% and drains more and more energy. When your energy is depleted, the effect ends and cannot be recast until your energy is restored.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Razor Claws
  MysticEnchant(id: 'mc_razor_claws', name: 'Razor Claws',
      description: 'Your Claw ability costs 10 energy, gains additional damage equal to 20% of your attack power, and now extends the duration of your Rake by 6 seconds and Rip by 2 seconds. Using it also sharpens your claws, increasing your physical damage by 2% and the damage of your next Rip by 5%. This effect stacks up to 3 times, and is consumed when you cast Rip.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Ambidextrous
  MysticEnchant(id: 'mc_ambidextrous', name: 'Ambidextrous',
      description: 'Your Single-Minded Fury off-hand attacks have a 50% chance to trigger an instant attack with your main-hand weapon and increase your attack power by 10% for 6 seconds. Your Bloodthirst and Execute and Rend casts have a chance to trigger an instant attack with your off-hand weapon and increase your off-hand damage by 40% for 6 seconds. These effects have separate internal cool-downs lasting 12 seconds and cannot occur simultaneously.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Crimson Champion
  MysticEnchant(id: 'mc_crimson_champion', name: 'Crimson Champion',
      description: 'Your Holy Shield ability is transformed into Holy Shield (Crimson Champion) which permanently increases your chance to block by 10% and deals Holy damage when blocking an attack. This damage can only occur once per second, and rather than consuming a charge of the buff it instead grants one. Three charges are consumed to empower your next ability:Shield Slam - Deals Holy damage to up to five nearby enemies.Avenger\'s Shield - Increases your block value by 15% and threat by 10% for 10 seconds. Power Word: Shield - Reduces all damage taken by 50% for 3 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Primordial Fury
  MysticEnchant(id: 'mc_primordial_fury', name: 'Primordial Fury',
      description: 'During Shamanistic Rage your Shaman non-periodic spell and ability criticals consume 50 rage to deal extra Elemental damage and empower you with Primordial Fury, increasing your spell damage by 30% of your Agility for 15 seconds. Elemental damage is a combination of the Nature, Fire and Frost schools, and will benefit from the highest modifier to either of these schools.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Heavyweight
  MysticEnchant(id: 'mc_heavyweight', name: 'Heavyweight',
      description: 'Dealing weapon damage with any Warrior attack reduces your attack speed by 5% but increases your physical damage by 2%, stacking up to 5 times. Normal auto attacks reset this effect. If you reach five stacks, your next melee swing will crush targets in front of you, dealing 110% unnormalized weapon damage. This damage is tripled and always crits against non-players, cannot crit against players.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Blademaster
  MysticEnchant(id: 'mc_blademaster', name: 'Blademaster',
      description: 'When you parry you gain 3% armor for 20 sec, stacking 5 times. At 5 stacks you empower the next ability you use, consuming the stacks and granting it an additional effect on hit:Devastate: Deals 50% additional damage and reduces the target\'s armor by an additional 10% for 10 seconds. Riposte: Increases the damage staggered by Tactical Mastery capstone by 10% for 10 seconds. Shield Slam: Increases your block value by 15% for 15 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Seed Of Life
  MysticEnchant(id: 'mc_seed_of_life', name: 'Seed Of Life',
      description: 'Your periodic heals from Regrowth and Rejuvenation plant a Seed of Life in the target, healing them each second for 4 seconds and stacking up to 8 times. Upon reaching 8 stacks the seed blooms and heals the target and up to 5 nearby allies.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Holy Ascension
  MysticEnchant(id: 'mc_holy_ascension', name: 'Holy Ascension',
      description: 'Reduces the cool-down of your Holy Fire by 3 seconds. After casting Holy Fire your next spell is empowered:Smite: Deals 50% (20% to players) additional damage. Exorcism: Increases all Holy damage you deal to the target by 5% for 15 seconds. Holy Shock: Guaranteed to critically strike and increases its damage and healing done by 20%.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Stormbringer
  MysticEnchant(id: 'mc_stormbringer', name: 'Stormbringer',
      description: 'Your damaging abilities have a chance to strike your target\'s location with lightning, dealing additional Nature damage to the target and leaving an electrified area slowing enemies by 50% and dealing damage every second for 4 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Blessing Of The Divines
  MysticEnchant(id: 'mc_blessing_of_the_divines', name: 'Blessing Of The Divines',
      description: 'Your healing spells have a chance to cast an additional beneficial effect on you or your allies.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Holy Radiance
  MysticEnchant(id: 'mc_holy_radiance', name: 'Holy Radiance',
      description: 'Your Greater Heal, Flash Heal and Penance spells now also heal all targets affected by your Renew for 25% of the amount. Also reduces the mana cost of Renew by 30%.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Wacky Wizard
  MysticEnchant(id: 'mc_wacky_wizard', name: 'Wacky Wizard',
      description: 'Your offensive Mage spell casts have a chance to cast an additional random Mage spell for free.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Divine Purpose
  MysticEnchant(id: 'mc_divine_purpose', name: 'Divine Purpose',
      description: 'When you heal with Penance, the damage of your next Penance spell is increased by 50%, and when you deal damage with Penance, the healing of your next Penance spell is increased by 75%. In addition, the cool-down of Penance is reduced by 2 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Endless Agony
  MysticEnchant(id: 'mc_endless_agony', name: 'Endless Agony',
      description: 'Each time your Curse of Agony ability deals damage it increases the damage the target takes from your Curse of Agony ability by 3%. Stacks 50 times. In addition, for 12 seconds after using Mind Blast or Shadow Word: Death your Shadow spell casts increases the duration of your Curse of Agony by 1 second.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Unrelenting Wrath
  MysticEnchant(id: 'mc_unrelenting_wrath', name: 'Unrelenting Wrath',
      description: 'Your Hunter ability critical strikes have a chance to cause your pet to enrage, increasing its damage by 30% for 5 seconds. Also increases the duration of your Bestial Wrath and The Beast Within by 2 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Paratrooper
  MysticEnchant(id: 'mc_paratrooper', name: 'Paratrooper',
      description: 'Your Disengage now launches you higher into the air and activates a Combat Parachute. While airborne, the high vantage point increases the critical strike chance of your Hunter shots by 25%. When the parachute is detached you gain 80% ranged attack speed for 6 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Tidecaller
  MysticEnchant(id: 'mc_tidecaller', name: 'Tidecaller',
      description: 'Your Healing Wave heals for 25% more and applies 3 stacks of Tidecaller\'s Boon on the target. This effect increases the healing they take from your periodic Nature healing spells by 20% per stack, but reduces the healing they take from your Healing Wave by 3% per stack. Tidecaller\'s Boon stacks up to 15 times and your periodic Nature healing removes one stack.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Astral Storm
  MysticEnchant(id: 'mc_astral_storm', name: 'Astral Storm',
      description: 'Your Thunderstorm is transformed into Astral Storm, a single-target spell dealing Astral damage. This spell is castable while moving and benefits from modifiers to Thunderstorm.Astral Storm forcefully knocks players back. If cast on a player afflicted by your Unrelenting Storm it will knock their soul out of their body, forcing your target and yourself into an alternate dimension for 8 seconds. Astral damage is a combination of the Arcane and Nature schools, and will benefit from the highest modifier to either school.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Consumed By Fire
  MysticEnchant(id: 'mc_consumed_by_fire', name: 'Consumed By Fire',
      description: 'Your Soul Fire can trigger Hot Streak. When your Pyroblast deals damage it refreshes the duration of your Corruption and Decimation now also increases the damage of your Pyroblast by 50% against monsters. In addition, your Immolate now triggers Backdraft.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Felborne
  MysticEnchant(id: 'mc_felborne', name: 'Felborne',
      description: 'You are infused with fel power. When you deal damage you have a chance to call down a fel meteor to the target area, dealing Chaos damage and increasing your chance to score a critical strike on the targets hiy by 5% for 8 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Fingers Of Death
  MysticEnchant(id: 'mc_fingers_of_death', name: 'Fingers Of Death',
      description: 'Your Fingers of Frost now also grants 2 stacks of Fingers of Death for 15 seconds, which causes your next Ice Lance to also launch a Shadow Lance.Shadow Lance hits grants a stack of Touch of Death for 15 seconds, which increases the damage of your next Vampiric Touch by 75%, stacking 2 times. In addition, your Frostbolt now applies Dark Winter to the target for 15 seconds, stacking 3 times, causing you to deal 3% increased periodic Shadow damage to the target.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Overheating
  MysticEnchant(id: 'mc_overheating', name: 'Overheating',
      description: 'Your melee abilities inflict additional Fire damage and apply a stack of Overheating to your target. Your Fire Mage spell cause Heat Stroke on targets inflicted with 3 stack of Overheating, dealing Fire damanage and reducing their movement speed by -40%.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Overloaded Froststorm
  MysticEnchant(id: 'mc_overloaded_froststorm', name: 'Overloaded Froststorm',
      description: 'You gain a stack of Overloaded when dealing direct Nature or Frost Damage. Upon reaching 20 stacks of Overloaded, you will trigger an Overloaded Froststorm on your target. This spell deals Froststorm damage over 8 seconds and increases your spell casting speed by 10% for 8 seconds. Froststorm damage is a combination of the Nature and Frost schools, and will benefit from the highest modifier to either school.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Tooth And Nail
  MysticEnchant(id: 'mc_tooth_and_nail', name: 'Tooth And Nail',
      description: 'Your Devastate has a 25% chance to give a buff lowering the cool-down of your Shockwave by 18 seconds for 8 seconds. This effect cannot occur more than once every minute.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Ready, Set, Go!
  MysticEnchant(id: 'mc_ready_set_go', name: 'Ready, Set, Go!',
      description: 'You gain 7% movement speed when standing still for 3 seconds, and gain additional movement speed the longer you remain standing still. This effect only works while in combat and stacks 5 times.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Lost Knowledge: Raise Dead
  MysticEnchant(id: 'mc_lost_knowledge_raise_dead', name: 'Lost Knowledge: Raise Dead',
      description: 'Teaches you how to Raise Dead.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Soul Siphon
  MysticEnchant(id: 'mc_soul_siphon', name: 'Soul Siphon',
      description: 'Your Haunt ability heals everyone in your party.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Plague Bearer
  MysticEnchant(id: 'mc_plague_bearer', name: 'Plague Bearer',
      description: 'You learn the Festering Strike ability. Your Mangle (Bear) ability now applies Rabies. Your Swipe (Bear) ability now spreads Infected Blood and Rabies.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Low Tide
  MysticEnchant(id: 'mc_low_tide', name: 'Low Tide',
      description: 'Your nature healing abilities on a target affected by your Riptide have %20 increased critical effect chance and have a %60 chance to spread the Riptide to another nearby ally. It addiition, it allows the periodic healing from Riptide to critically heal.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Eldritch Knight
  MysticEnchant(id: 'mc_eldritch_knight', name: 'Eldritch Knight',
      description: 'Your successful melee hits generate mana.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Controlled Burn
  MysticEnchant(id: 'mc_controlled_burn', name: 'Controlled Burn',
      description: 'Your Conflagrate spell no longer consumes Immolate. In addition, your Chaos Bolt will increase the duration of Immolate on the target by 6 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Battle Fervor
  MysticEnchant(id: 'mc_battle_fervor', name: 'Battle Fervor',
      description: 'Your Charge ability triggers Improved Victory Rush. Battle Shout increases attack speed and movement speed by 30% for 3 seconds while in Battle Stance. This effect cannot occur more than once every 10 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Unbounded Mind Flay
  MysticEnchant(id: 'mc_unbounded_mind_flay', name: 'Unbounded Mind Flay',
      description: 'Your Mind Flay is transformed into Mind Flay (Unbounded Mind Flay), giving it a conal targetting type.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Stormborn
  MysticEnchant(id: 'mc_stormborn', name: 'Stormborn',
      description: 'Elemental Mastery now also increases your melee haste by 15% and halves the cool-down of your Stormstrike. While Elemental Mastery or Shamanistic Rage are active, your Stormstrike deals additional Nature damage to all enemies in front of you. In addition, the damage of your Lightning Bolt and Chain Lightning spells is now increased by 20% your attack power, and your Lightning Shield orbs by 10% of your attack power.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Frost Bomb
  MysticEnchant(id: 'mc_frost_bomb', name: 'Frost Bomb',
      description: 'Transforms your Living Bomb into Frost Bomb, a 1.5 sec cast time spell which places a Frost Bomb on the target for 6 sec. Your Frostbolts trigger the release of a wave of freezing ice, dealing Frost damage and slowing the target and all other enemies within 10 yards by 30%. When the effect ends or is dispelled, another stronger wave will release, dealing increased damage and reducing enemy movement speed by 60%, and grants 1% haste for each enemy hit for 6 sec, stacking up to 10 times. Casting Frost Bomb triggers the Flash Freeze talent. Its cool-down is reduced by the Cold as Ice talent.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Prayer of Preservation
  MysticEnchant(id: 'mc_prayer_of_preservation', name: 'Prayer of Preservation',
      description: 'Transforms your Prayer of Healing into a channeled healing spell that when placed reduces the damage all allies inside the effect take from area of effect attacks by 30% and heals up to five low health allies every second. The heal scales with modifiers to Prayer of Healing. The final heal is extra powerful and grants a buff to its targets giving your next direct heal on that target 20% increased critical effect chance, making it trigger an additional heal and reduce the cool-down of your Prayer of Preservation by 3 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Dragon Warrior
  MysticEnchant(id: 'mc_dragon_warrior', name: 'Dragon Warrior',
      description: 'Death Wish is transformed into Dragon Roar which slows nearby enemies for 2 sec and deals armor-piercing damage. Also increases your physical damage done by 15% for 10 seconds. Your Bloodthirst and Execute hits empower your Slam to be instant cast and trigger extra weapon-based damage. These empowered Slams also reduce the cool-down of your Dragon Roar by 5 seconds and increase the damage of your Dragon Roar by 25%, stacking up to 3 times. On 3 stacks, your Dragon Roar also stuns nearby enemies for 2 sec. If you know Intercept you also learn Dragon Charge, which propels you forward at 100% increased speed and makes you immune to movement impairing effects for up to 2 seconds or until you impact with an enemy. Upon impact you deal Fire damage in front of you.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Forbidden Technique
  MysticEnchant(id: 'mc_forbidden_technique', name: 'Forbidden Technique',
      description: 'Replaces your Shadow Dance with Forbidden Technique, firing a projectile dealing 130% Ranged Weapon damage as Shadow, teleporting you to the target and activating Shadow Dance. Your Shadow remains behind. While Shadow Dance is active, your Ambush costs 30 less energy and causes your Shadow to throw a Shadow Dagger at your target. When Shadow Dance ends you teleport back to your Shadow, absorbing some of its power. This gives you a chance to follow up your Ranged weapon attacks by throwing a Shadow Dagger at the target, dealing bonus damage and reducing the cool-down of your Forbidden Technique by 2 seconds.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Corrupted Bear Form
  MysticEnchant(id: 'mc_corrupted_bear_form', name: 'Corrupted Bear Form',
      description: 'Corrupts your Bear Form, reducing your Physical damage by 30% but making your melee attacks deal additional high-threat Shadow damage. While in Corrupted Bear Form, your Maul and Mangle (Bear) have a chance to apply Corruption and your Swipe (Bear) drains life from targets afflicted by your Corruption. In addition, Shadow Bolts made instant by Nightfall or Backlash can be cast without leaving Corrupted Bear Form and will hit up to two additional targets, dealing reduced damage.', tier: EnchantTier.legendary),
  // Legendary (Orange) - Harbinger of Pestilence
  MysticEnchant(id: 'mc_harbinger_of_pestilence', name: 'Harbinger of Pestilence',
      description: 'Your Insect Swarm is transformed into Insect Swarm (Plague), a disease spell dealing Plague damage, and benefiting from the damage increase from Haunt. Your Wrath now grants you a stack of Plaguebringer which increases the damage of your diseases by 20% while active for 5 seconds, stacking 3 times. In addition, casting Haunt while you have Plaguebringer stacks causes an explosion around the target, shooting bile on nearby enemies dealing Plague damage to up to 5 targets based on the number of stacks you have. Plague damage is a combination of the Shadow and Nature schools and will benefit from the highest modifiers to either school.', tier: EnchantTier.legendary),
];