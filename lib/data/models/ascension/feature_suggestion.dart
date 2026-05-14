import 'package:flutter/foundation.dart';

@immutable
class FeatureSuggestion {
  final String id;
  final String title;
  final String? description;
  final String status;
  final String? submitterIp;
  final int upvotes;
  final int downvotes;
  final String? createdAt;
  final String? updatedAt;

  const FeatureSuggestion({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    this.submitterIp,
    required this.upvotes,
    required this.downvotes,
    this.createdAt,
    this.updatedAt,
  });

  factory FeatureSuggestion.fromJson(Map<String, dynamic> json) =>
      FeatureSuggestion(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        status: json['status'] as String,
        submitterIp: json['submitter_ip'] as String?,
        upvotes: json['upvotes'] as int? ?? 0,
        downvotes: json['downvotes'] as int? ?? 0,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'status': status,
        'submitter_ip': submitterIp,
        'upvotes': upvotes,
        'downvotes': downvotes,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
