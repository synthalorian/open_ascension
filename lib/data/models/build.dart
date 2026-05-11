import 'package:json_annotation/json_annotation.dart';

part 'build.g.dart';

@JsonSerializable()
class Build {
  final String id;
  final String name;
  final String? raceId;
  final bool isClassless;
  final String? realm;
  final List<String> abilityIds;
  final List<String> talentIds;
  final Map<String, String> enchantSlots;
  final Map<String, dynamic>? stats;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? notes;

  const Build({
    required this.id,
    required this.name,
    this.raceId,
    required this.isClassless,
    this.realm,
    required this.abilityIds,
    required this.talentIds,
    required this.enchantSlots,
    this.stats,
    required this.createdAt,
    this.updatedAt,
    this.notes,
  });

  factory Build.fromJson(Map<String, dynamic> json) => _$BuildFromJson(json);
  Map<String, dynamic> toJson() => _$BuildToJson(this);

  Build copyWith({
    String? name,
    String? raceId,
    bool? isClassless,
    String? realm,
    List<String>? abilityIds,
    List<String>? talentIds,
    Map<String, String>? enchantSlots,
    Map<String, dynamic>? stats,
    String? notes,
  }) {
    return Build(
      id: id,
      name: name ?? this.name,
      raceId: raceId ?? this.raceId,
      isClassless: isClassless ?? this.isClassless,
      realm: realm ?? this.realm,
      abilityIds: abilityIds ?? this.abilityIds,
      talentIds: talentIds ?? this.talentIds,
      enchantSlots: enchantSlots ?? this.enchantSlots,
      stats: stats ?? this.stats,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
      notes: notes ?? this.notes,
    );
  }
}
