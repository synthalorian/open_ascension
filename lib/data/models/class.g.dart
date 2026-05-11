// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarClass _$WarClassFromJson(Map<String, dynamic> json) => WarClass(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  colorHex: json['colorHex'] as String,
  role: $enumDecode(_$ClassRoleEnumMap, json['role']),
  description: json['description'] as String,
  iconPath: json['iconPath'] as String?,
  resourceTypes: (json['resourceTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  weaponTypes: (json['weaponTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  armorTypes: (json['armorTypes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  specNames: (json['specNames'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$WarClassToJson(WarClass instance) => <String, dynamic>{
  'id': instance.id,
  'displayName': instance.displayName,
  'colorHex': instance.colorHex,
  'role': _$ClassRoleEnumMap[instance.role]!,
  'description': instance.description,
  'iconPath': instance.iconPath,
  'resourceTypes': instance.resourceTypes,
  'weaponTypes': instance.weaponTypes,
  'armorTypes': instance.armorTypes,
  'specNames': instance.specNames,
};

const _$ClassRoleEnumMap = {
  ClassRole.melee: 'melee',
  ClassRole.ranged: 'ranged',
  ClassRole.caster: 'caster',
};
