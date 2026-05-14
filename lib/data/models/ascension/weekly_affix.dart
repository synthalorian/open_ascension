import 'package:flutter/foundation.dart';

@immutable
class WeeklyAffix {
  final String id;
  final String affixId;
  final String? weekStart;
  final String? createdAt;

  const WeeklyAffix({
    required this.id,
    required this.affixId,
    this.weekStart,
    this.createdAt,
  });

  factory WeeklyAffix.fromJson(Map<String, dynamic> json) => WeeklyAffix(
        id: json['id'] as String,
        affixId: json['affix_id'] as String,
        weekStart: json['week_start'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'affix_id': affixId,
        'week_start': weekStart,
        'created_at': createdAt,
      };
}
