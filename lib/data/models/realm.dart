import 'package:json_annotation/json_annotation.dart';

part 'realm.g.dart';

enum RealmStatus { online, maintenance, full }

enum RealmType { progressive, seasonal, conquest }

@JsonSerializable()
class Realm {
  final String id;
  final String name;
  final RealmType type;
  final RealmStatus status;
  final String? description;
  final String? currentPhase;
  final String? population;

  const Realm({
    required this.id,
    required this.name,
    required this.type,
    required this.status,
    this.description,
    this.currentPhase,
    this.population,
  });

  factory Realm.fromJson(Map<String, dynamic> json) => _$RealmFromJson(json);
  Map<String, dynamic> toJson() => _$RealmToJson(this);
}

const sampleRealms = [
  Realm(id: 'bronzebeard', name: 'Bronzebeard', type: RealmType.progressive, status: RealmStatus.online, description: 'Classic progressive journey from Vanilla through WotLK.', currentPhase: 'WotLK', population: 'High'),
  Realm(id: 'area52', name: 'Area 52', type: RealmType.progressive, status: RealmStatus.online, description: 'Progressive realm with custom Ascension content.', currentPhase: 'WotLK', population: 'Medium'),
  Realm(id: 'elune', name: 'Elune', type: RealmType.progressive, status: RealmStatus.online, description: 'Progressive realm focused on PvE.', currentPhase: 'WotLK', population: 'Medium'),
  Realm(id: 'voljin', name: 'Vol\'jin - CoA Beta', type: RealmType.conquest, status: RealmStatus.online, description: 'Conquest of Azeroth Beta with 21 custom classes.', currentPhase: 'CoA Beta', population: 'Low'),
  Realm(id: 'grizzlyhills', name: 'Grizzly Hills', type: RealmType.seasonal, status: RealmStatus.maintenance, description: 'Seasonal realm starting from Vanilla.', currentPhase: 'Maintenance', population: 'N/A'),
  Realm(id: 'bronzebeard_qa', name: 'Bronzebeard QA', type: RealmType.seasonal, status: RealmStatus.online, description: 'QA testing realm for upcoming content.', currentPhase: 'Test', population: 'Low'),
];
