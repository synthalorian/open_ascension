// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Realm _$RealmFromJson(Map<String, dynamic> json) => Realm(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$RealmTypeEnumMap, json['type']),
  status: $enumDecode(_$RealmStatusEnumMap, json['status']),
  description: json['description'] as String?,
  currentPhase: json['currentPhase'] as String?,
  population: json['population'] as String?,
);

Map<String, dynamic> _$RealmToJson(Realm instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$RealmTypeEnumMap[instance.type]!,
  'status': _$RealmStatusEnumMap[instance.status]!,
  'description': instance.description,
  'currentPhase': instance.currentPhase,
  'population': instance.population,
};

const _$RealmTypeEnumMap = {
  RealmType.progressive: 'progressive',
  RealmType.seasonal: 'seasonal',
  RealmType.conquest: 'conquest',
};

const _$RealmStatusEnumMap = {
  RealmStatus.online: 'online',
  RealmStatus.maintenance: 'maintenance',
  RealmStatus.full: 'full',
};
