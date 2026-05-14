import 'package:flutter/foundation.dart';

@immutable
class Tag {
  final String id;
  final String? name;
  final String? zone;
  final double? x;
  final double? y;
  final String? createdAt;

  const Tag({
    required this.id,
    this.name,
    this.zone,
    this.x,
    this.y,
    this.createdAt,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json['id'] as String,
        name: json['name'] as String?,
        zone: json['zone'] as String?,
        x: (json['x'] as num?)?.toDouble(),
        y: (json['y'] as num?)?.toDouble(),
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'zone': zone,
        'x': x,
        'y': y,
        'created_at': createdAt,
      };
}
