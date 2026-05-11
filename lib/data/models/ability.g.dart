// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  classId: json['classId'] as String,
  school: $enumDecode(_$DamageSchoolEnumMap, json['school']),
  minLevel: (json['minLevel'] as num).toInt(),
  manaCost: (json['manaCost'] as num?)?.toDouble(),
  cooldown: (json['cooldown'] as num?)?.toDouble(),
  icon: json['icon'] as String?,
  isPassive: json['isPassive'] as bool? ?? false,
  isClassless: json['isClassless'] as bool? ?? true,
);

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'classId': instance.classId,
  'school': _$DamageSchoolEnumMap[instance.school]!,
  'minLevel': instance.minLevel,
  'manaCost': instance.manaCost,
  'cooldown': instance.cooldown,
  'icon': instance.icon,
  'isPassive': instance.isPassive,
  'isClassless': instance.isClassless,
};

const _$DamageSchoolEnumMap = {
  DamageSchool.physical: 'physical',
  DamageSchool.holy: 'holy',
  DamageSchool.nature: 'nature',
  DamageSchool.fire: 'fire',
  DamageSchool.frost: 'frost',
  DamageSchool.shadow: 'shadow',
  DamageSchool.arcane: 'arcane',
};
