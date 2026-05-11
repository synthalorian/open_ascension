// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Race _$RaceFromJson(Map<String, dynamic> json) => Race(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  faction: $enumDecode(_$FactionEnumMap, json['faction']),
  description: json['description'] as String,
  allowedClasses: (json['allowedClasses'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  racialAbilities: (json['racialAbilities'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$RaceToJson(Race instance) => <String, dynamic>{
  'id': instance.id,
  'displayName': instance.displayName,
  'faction': _$FactionEnumMap[instance.faction]!,
  'description': instance.description,
  'allowedClasses': instance.allowedClasses,
  'racialAbilities': instance.racialAbilities,
};

const _$FactionEnumMap = {
  Faction.alliance: 'alliance',
  Faction.horde: 'horde',
  Faction.neutral: 'neutral',
};
