import 'package:flutter/foundation.dart';

@immutable
class EnchantSuggestion {
  final String id;
  final String? enchantName;
  final String? description;
  final String? submitterIp;
  final String? status;
  final String? createdAt;

  const EnchantSuggestion({
    required this.id,
    this.enchantName,
    this.description,
    this.submitterIp,
    this.status,
    this.createdAt,
  });

  factory EnchantSuggestion.fromJson(Map<String, dynamic> json) =>
      EnchantSuggestion(
        id: json['id'] as String,
        enchantName: json['enchant_name'] as String?,
        description: json['description'] as String?,
        submitterIp: json['submitter_ip'] as String?,
        status: json['status'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'enchant_name': enchantName,
        'description': description,
        'submitter_ip': submitterIp,
        'status': status,
        'created_at': createdAt,
      };
}
