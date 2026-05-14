import 'package:flutter/foundation.dart';

@immutable
class Weakaura {
  final String id;
  final String? name;
  final String? author;
  final String? description;
  final String? code; // Weakaura string
  final String? version;
  final String? createdAt;
  final String? updatedAt;

  const Weakaura({
    required this.id,
    this.name,
    this.author,
    this.description,
    this.code,
    this.version,
    this.createdAt,
    this.updatedAt,
  });

  factory Weakaura.fromJson(Map<String, dynamic> json) => Weakaura(
        id: json['id'] as String,
        name: json['name'] as String?,
        author: json['author'] as String?,
        description: json['description'] as String?,
        code: json['code'] as String?,
        version: json['version'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'author': author,
        'description': description,
        'code': code,
        'version': version,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
