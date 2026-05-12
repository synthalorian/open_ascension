import 'package:json_annotation/json_annotation.dart';
import 'class.dart';

part 'race.g.dart';

@JsonSerializable()
class Race {
  final String id;
  final String displayName;
  final Faction faction;
  final String description;
  final List<String> allowedClasses;
  final List<String> racialAbilities;

  const Race({
    required this.id,
    required this.displayName,
    required this.faction,
    required this.description,
    required this.allowedClasses,
    required this.racialAbilities,
  });

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);
  Map<String, dynamic> toJson() => _$RaceToJson(this);

  @override
  String toString() => 'Race($id: $displayName)';

  static Race findById(String id) =>
      allRaces.firstWhere((r) => r.id == id, orElse: () => allRaces.first);
}

const List<Race> allianceRaces = [
  Race(id: 'human', displayName: 'Human', faction: Faction.alliance,
      description: 'Ambitious and adaptable.',
      allowedClasses: ['warrior', 'paladin', 'priest', 'rogue', 'mage', 'warlock'],
      racialAbilities: ['The Human Spirit']),
  Race(id: 'dwarf', displayName: 'Dwarf', faction: Faction.alliance,
      description: 'Hardy mountain folk.',
      allowedClasses: ['warrior', 'paladin', 'priest', 'shaman', 'mage', 'warlock'],
      racialAbilities: ['Stoneform', 'Find Treasures']),
  Race(id: 'night_elf', displayName: 'Night Elf', faction: Faction.alliance,
      description: 'Ancient guardians blessed by Elune.',
      allowedClasses: ['warrior', 'hunter', 'priest', 'rogue', 'mage'],
      racialAbilities: ['Shadow Veil', 'Thorns']),
  Race(id: 'gnome', displayName: 'Gnome', faction: Faction.alliance,
      description: 'Brilliant inventors and arcane scholars.',
      allowedClasses: ['rogue', 'hunter', 'mage', 'warlock'],
      racialAbilities: ['Escape Artist']),
  Race(id: 'draenei', displayName: 'Draenei', faction: Faction.alliance,
      description: 'Exiled prophets from Argus.',
      allowedClasses: ['warrior', 'paladin', 'priest', 'shaman', 'mage', 'warlock'],
      racialAbilities: ['Gift of the Naaru']),
  Race(id: 'worgen', displayName: 'Worgen', faction: Faction.alliance,
      description: 'Cursed bear-men from Gilneas.',
      allowedClasses: ['warrior', 'hunter', 'rogue'],
      racialAbilities: ['Berserker', 'Savagery']),
];

const List<Race> hordeRaces = [
  Race(id: 'orc', displayName: 'Orc', faction: Faction.horde,
      description: 'Fierce warriors.',
      allowedClasses: ['warrior', 'shaman', 'death_knight', 'rogue'],
      racialAbilities: ['Commanding Shout', 'Hardiness']),
  Race(id: 'forsaken', displayName: 'Forsaken', faction: Faction.horde,
      description: 'Reanimated undead.',
      allowedClasses: ['warrior', 'priest', 'rogue', 'mage', 'warlock', 'death_knight'],
      racialAbilities: ['Cannibalize', 'Will of the Forsaken']),
  Race(id: 'tauren', displayName: 'Tauren', faction: Faction.horde,
      description: 'Tall shamanistic guardians.',
      allowedClasses: ['warrior', 'priest', 'shaman'],
      racialAbilities: ['War Stomp', 'Cower']),
  Race(id: 'blood_elf', displayName: 'Blood Elf', faction: Faction.horde,
      description: 'Magic-dependent survivors.',
      allowedClasses: ['warrior', 'paladin', 'hunter', 'rogue', 'mage', 'warlock'],
      racialAbilities: ['Arcane Torrent']),
  Race(id: 'goblin', displayName: 'Goblin', faction: Faction.horde,
      description: 'Profit-driven traders.',
      allowedClasses: ['warrior', 'rogue', 'hunter', 'mage'],
      racialAbilities: ['Cannibalize', 'Rocket Jump']),
];

const List<Race> allRaces = [...allianceRaces, ...hordeRaces];
