import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

enum ClassRole { melee, ranged, caster }

enum Faction { alliance, horde, neutral }

@JsonSerializable()
class WarClass {
  final String id;
  final String displayName;
  final String colorHex;
  final ClassRole role;
  final String description;
  final String? iconPath;
  final List<String> resourceTypes;
  final List<String> weaponTypes;
  final List<String> armorTypes;
  final List<String> specNames;

  const WarClass({
    required this.id,
    required this.displayName,
    required this.colorHex,
    required this.role,
    required this.description,
    this.iconPath,
    required this.resourceTypes,
    required this.weaponTypes,
    required this.armorTypes,
    required this.specNames,
  });

  factory WarClass.fromJson(Map<String, dynamic> json) => _$WarClassFromJson(json);
  Map<String, dynamic> toJson() => _$WarClassToJson(this);

  Color get color => Color(int.parse(colorHex.replaceFirst('#', '0xff')));

  /// Returns the color for each spec for per-spec coloring in talent tree.
  List<Color> get specColors {
    final base = color;
    final alpha = base.withValues(alpha: 0.5);
    return List.generate(specNames.length, (i) {
      if (i == 0) return color;
      if (i == 1) return alpha;
      return base.withValues(alpha: 0.3);
    });
  }

  @override
  String toString() => 'WarClass($id: $displayName)';

  static const all = [
    WarClass(id: 'warrior', displayName: 'Warrior', colorHex: '#C79C68', role: ClassRole.melee,
        description: 'Master of melee combat, capable of switching between stances for different playstyles.',
        resourceTypes: ['Rage'], weaponTypes: ['Sword', 'Axe', 'Mace', 'Polearm', 'Gun'],
        armorTypes: ['Plate'], specNames: ['Arms', 'Fury', 'Protection']),
    WarClass(id: 'paladin', displayName: 'Paladin', colorHex: '#F5D76B', role: ClassRole.melee,
        description: 'Holy warriors who combine martial prowess with divine magic.',
        resourceTypes: ['Holy Power'], weaponTypes: ['Sword', 'Mace', 'Polearm'],
        armorTypes: ['Plate'], specNames: ['Retribution', 'Holy', 'Protection']),
    WarClass(id: 'hunter', displayName: 'Hunter', colorHex: '#AAD373', role: ClassRole.ranged,
        description: 'Masters of the hunt who use beasts and ranged weapons to fight.',
        resourceTypes: ['Focus'], weaponTypes: ['Bow', 'Gun', 'Crossbow'],
        armorTypes: ['Leather', 'Mail'], specNames: ['Beast Mastery', 'Marksmanship', 'Survival']),
    WarClass(id: 'rogue', displayName: 'Rogue', colorHex: '#FFF569', role: ClassRole.melee,
        description: 'Stealthy assassins who strike from the shadows.',
        resourceTypes: ['Energy'], weaponTypes: ['Dagger', 'Sword', 'Axe', 'Fist'],
        armorTypes: ['Leather'], specNames: ['Combat', 'Subtlety', 'Outlaw']),
    WarClass(id: 'priest', displayName: 'Priest', colorHex: '#FFFFFF', role: ClassRole.caster,
        description: 'Divine healers who serve the Light.',
        resourceTypes: ['Mana'], weaponTypes: ['Staff', 'Mace', 'One-Hand'],
        armorTypes: ['Cloth'], specNames: ['Discipline', 'Holy', 'Shadow']),
    WarClass(id: 'death_knight', displayName: 'Death Knight', colorHex: '#C41F3B', role: ClassRole.melee,
        description: 'Undead warriors cursed with undeath, masters of death magic.',
        resourceTypes: ['Runic Power', 'Runes'], weaponTypes: ['Melee', 'Polearm', 'Two-Hand'],
        armorTypes: ['Plate'], specNames: ['Blood', 'Unholy', 'Frost']),
    WarClass(id: 'shaman', displayName: 'Shaman', colorHex: '#0070DD', role: ClassRole.melee,
        description: 'Spiritualists who draw power from the elements.',
        resourceTypes: ['Mana'], weaponTypes: ['Staff', 'Tomahawk', 'Scepter'],
        armorTypes: ['Mail'], specNames: ['Enhancement', 'Elemental', 'Restoration']),
    WarClass(id: 'mage', displayName: 'Mage', colorHex: '#68CCEF', role: ClassRole.caster,
        description: 'Arcane spellcasters who manipulate the fabric of reality.',
        resourceTypes: ['Mana'], weaponTypes: ['Staff', 'Wand'],
        armorTypes: ['Cloth'], specNames: ['Arcane', 'Fire', 'Frost']),
    WarClass(id: 'warlock', displayName: 'Warlock', colorHex: '#9482C9', role: ClassRole.caster,
        description: 'Demonic pacts fuel their devastating dark magic.',
        resourceTypes: ['Mana'], weaponTypes: ['Staff', 'Wand'],
        armorTypes: ['Cloth'], specNames: ['Affliction', 'Demonology', 'Destruction']),
    WarClass(id: 'druid', displayName: 'Druid', colorHex: '#FF7D0A', role: ClassRole.melee,
        description: 'Shapeshifters who draw power from nature, capable of healing, DPS, and tanking.',
        resourceTypes: ['Mana', 'Energy', 'Rage'], weaponTypes: ['Staff', 'Fist', 'Mace', 'Dagger'],
        armorTypes: ['Leather'], specNames: ['Balance', 'Feral', 'Restoration']),
  ];

  static const allWarClasses = all;

  static WarClass findById(String id) =>
      all.firstWhere((c) => c.id == id, orElse: () => all.first);
}
