import 'package:flutter/foundation.dart';

@immutable
class ItemAffixSuggestion {
  final String id;
  final String? name;
  final String? category;
  final String? description;
  final String? submitterIp;
  final String? status;
  final String? createdAt;

  const ItemAffixSuggestion({
    required this.id,
    this.name,
    this.category,
    this.description,
    this.submitterIp,
    this.status,
    this.createdAt,
  });

  factory ItemAffixSuggestion.fromJson(Map<String, dynamic> json) =>
      ItemAffixSuggestion(
        id: json['id'] as String,
        name: json['name'] as String?,
        category: json['category'] as String?,
        description: json['description'] as String?,
        submitterIp: json['submitter_ip'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'description': description,
        'submitter_ip': submitterIp,
        'status': status,
        'created_at': createdAt,
      };
}
