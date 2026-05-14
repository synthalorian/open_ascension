import 'package:flutter/foundation.dart';

@immutable
class Server {
  final String id;
  final String name;
  final String? createdAt;

  const Server({
    required this.id,
    required this.name,
    this.createdAt,
  });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
        id: json['id'] as String,
        name: json['name'] as String,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'created_at': createdAt,
      };
}
