// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lore_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoreEntry _$LoreEntryFromJson(Map<String, dynamic> json) => LoreEntry(
  id: json['id'] as String,
  title: json['title'] as String,
  category: $enumDecode(_$LoreCategoryEnumMap, json['category']),
  summary: json['summary'] as String,
  content: json['content'] as String,
  imageUrl: json['imageUrl'] as String?,
  relatedIds:
      (json['relatedIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$LoreEntryToJson(LoreEntry instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'category': _$LoreCategoryEnumMap[instance.category]!,
  'summary': instance.summary,
  'content': instance.content,
  'imageUrl': instance.imageUrl,
  'relatedIds': instance.relatedIds,
};

const _$LoreCategoryEnumMap = {
  LoreCategory.timeline: 'timeline',
  LoreCategory.characters: 'characters',
  LoreCategory.factions: 'factions',
  LoreCategory.locations: 'locations',
  LoreCategory.ascension: 'ascension',
  LoreCategory.items: 'items',
};
