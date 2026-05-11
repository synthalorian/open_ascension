import 'package:json_annotation/json_annotation.dart';

part 'realm.g.dart';

enum RealmStatus { online, maintenance, full }

extension RealmStatusX on RealmStatus {
  String get displayName {
    switch (this) {
      case RealmStatus.online: return 'Online';
      case RealmStatus.maintenance: return 'Maintenance';
      case RealmStatus.full: return 'Full';
    }
  }
}

enum RealmType {
  progressive('Progressive', 'Journey through expansions in phases'),
  seasonal('Seasonal', 'Starts fresh each season'),
  conquest('Conquest of Azeroth', 'Custom classes with 3 specs each');

  const RealmType(this.displayName, this.description);
  final String displayName;
  final String description;
}

@JsonSerializable()
class Realm {
  final String id;
  final String name;
  final RealmType type;
  final RealmStatus status;
  final bool isPvP;
  final String maxLevel;
  final String? description;
  final String? currentPhase;
  final String? population;
  final String? hostAddress;

  const Realm({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    this.isPvP = false,
    this.maxLevel = '80',
    this.description,
    this.currentPhase,
    this.population,
    this.hostAddress,
  });

  factory Realm.fromJson(Map<String, dynamic> json) => _$RealmFromJson(json);
  Map<String, dynamic> toJson() => _$RealmToJson(this);
}

const sampleRealms = [
  Realm(id: 'bronzebeard', name: 'Bronzebeard', type: RealmType.progressive, status: RealmStatus.online,
      isPvP: true, maxLevel: '80', description: 'Classic progressive journey from Vanilla through WotLK. The flagship realm of Project Ascension.',
      currentPhase: 'WotLK', population: 'High', hostAddress: 'us.bronzebeard.ascension.gg:8085'),
  Realm(id: 'area52', name: 'Area 52', type: RealmType.progressive, status: RealmStatus.online,
      isPvP: false, maxLevel: '80', description: 'Progressive realm with custom Ascension content. PvE focused.',
      currentPhase: 'WotLK', population: 'Medium', hostAddress: 'us.area52.ascension.gg:8085'),
  Realm(id: 'elune', name: 'Elune', type: RealmType.progressive, status: RealmStatus.online,
      isPvP: false, maxLevel: '80', description: 'Progressive realm focused on PvE with a welcoming community.',
      currentPhase: 'WotLK', population: 'Medium', hostAddress: 'us.elune.ascension.gg:8085'),
  Realm(id: 'voljin', name: "Vol'jin", type: RealmType.conquest, status: RealmStatus.online,
      isPvP: true, maxLevel: '90', description: 'Conquest of Azeroth — 21 custom classes with 3 specializations each. The most ambitious WoW custom content ever created.',
      currentPhase: 'CoA Beta', population: 'Low', hostAddress: 'us.voljin.ascension.gg:8085'),
  Realm(id: 'grizzlyhills', name: 'Grizzly Hills', type: RealmType.seasonal, status: RealmStatus.maintenance,
      isPvP: true, maxLevel: '80', description: 'Seasonal realm starting from Vanilla. Each season resets for a fresh experience.',
      currentPhase: 'Maintenance', population: 'N/A'),
  Realm(id: 'bronzebeard_qa', name: 'Bronzebeard QA', type: RealmType.seasonal, status: RealmStatus.online,
      isPvP: false, maxLevel: '80', description: 'QA testing realm for upcoming content and balance changes. Not for regular play.',
      currentPhase: 'Test', population: 'Low'),
];
