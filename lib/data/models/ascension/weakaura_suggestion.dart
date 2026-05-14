import 'package:flutter/foundation.dart';

@immutable
class WeakauraSuggestion {
  final String id;
  final String? weakauraId;
  final String? comment;
  final String? createdAt;

  const WeakauraSuggestion({
    required this.id,
    this.weakauraId,
    this.comment,
    this.createdAt,
  });

  factory WeakauraSuggestion.fromJson(Map<String, dynamic> json) =>
      WeakauraSuggestion(
        id: json['id'] as String,
        weakauraId: json['weakaura_id'] as String?,
        comment: json['comment'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'weakaura_id': weakauraId,
        'comment': comment,
        'created_at': createdAt,
      };
}
