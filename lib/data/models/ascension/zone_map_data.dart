import 'package:flutter/foundation.dart';

@immutable
class ZoneMapData {
  final List<ZoneContinent> easternKingdoms;
  final List<ZoneContinent> kalimdor;
  final List<ZoneContinent> outlands;
  final List<ZoneContinent> other;

  const ZoneMapData({
    required this.easternKingdoms,
    required this.kalimdor,
    required this.outlands,
    required this.other,
  });

  factory ZoneMapData.fromJson(Map<String, dynamic> json) => ZoneMapData(
        easternKingdoms: (json['eastern_kingdoms'] as List<dynamic>)
            .map((z) => ZoneContinent.fromJson(z as Map<String, dynamic>))
            .toList(growable: false),
        kalimdor: (json['kalimdor'] as List<dynamic>)
            .map((z) => ZoneContinent.fromJson(z as Map<String, dynamic>))
            .toList(growable: false),
        outlands: (json['outlands'] as List<dynamic>)
            .map((z) => ZoneContinent.fromJson(z as Map<String, dynamic>))
            .toList(growable: false),
        other: (json['other'] as List<dynamic>)
            .map((z) => ZoneContinent.fromJson(z as Map<String, dynamic>))
            .toList(growable: false),
      );

  Map<String, dynamic> toJson() => {
        'eastern_kingdoms': easternKingdoms.map((z) => z.toJson()).toList(),
        'kalimdor': kalimdor.map((z) => z.toJson()).toList(),
        'outlands': outlands.map((z) => z.toJson()).toList(),
        'other': other.map((z) => z.toJson()).toList(),
      };
}

@immutable
class ZoneContinent {
  final String zone;
  final int count;
  final List<String> enchants;

  const ZoneContinent({
    required this.zone,
    required this.count,
    required this.enchants,
  });

  factory ZoneContinent.fromJson(Map<String, dynamic> json) => ZoneContinent(
        zone: json['zone'] as String,
        count: json['count'] as int,
        enchants: (json['enchants'] as List<dynamic>)
            .map((e) => e as String)
            .toList(growable: false),
      );

  Map<String, dynamic> toJson() => {
        'zone': zone,
        'count': count,
        'enchants': enchants,
      };
}
