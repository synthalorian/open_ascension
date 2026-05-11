// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Talent _$TalentFromJson(Map<String, dynamic> json) => Talent(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  classId: json['classId'] as String,
  specName: json['specName'] as String?,
  tier: (json['tier'] as num).toInt(),
  row: (json['row'] as num).toInt(),
  column: (json['column'] as num).toInt(),
  maxRank: (json['maxRank'] as num?)?.toInt() ?? 1,
  prereqTalentId: json['prereqTalentId'] as String?,
  icon: json['icon'] as String?,
  isClassless: json['isClassless'] as bool? ?? true,
);

Map<String, dynamic> _$TalentToJson(Talent instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'classId': instance.classId,
  'specName': instance.specName,
  'tier': instance.tier,
  'row': instance.row,
  'column': instance.column,
  'maxRank': instance.maxRank,
  'prereqTalentId': instance.prereqTalentId,
  'icon': instance.icon,
  'isClassless': instance.isClassless,
};
