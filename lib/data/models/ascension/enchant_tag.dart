import 'package:flutter/foundation.dart';

@immutable
class EnchantTag {
  final String id;
  final String? enchantId;
  final String? tag;

  const EnchantTag({
    required this.id,
    this.enchantId,
    this.tag,
  });

  factory EnchantTag.fromJson(Map<String, dynamic> json) => EnchantTag(
        id: json['id'] as String,
        enchantId: json['enchant_id'] as String?,
        tag: json['tag'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'enchant_id': enchantId,
        'tag': tag,
      };
}
