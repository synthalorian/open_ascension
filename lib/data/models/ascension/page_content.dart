import 'package:flutter/foundation.dart';

@immutable
class PageContent {
  final String id;
  final String pageKey;
  final String title;
  final String? subtitle;
  final String? bodyContent;
  final String? createdAt;
  final String? updatedAt;

  const PageContent({
    required this.id,
    required this.pageKey,
    required this.title,
    this.subtitle,
    this.bodyContent,
    this.createdAt,
    this.updatedAt,
  });

  factory PageContent.fromJson(Map<String, dynamic> json) => PageContent(
        id: json['id'] as String,
        pageKey: json['page_key'] as String,
        title: json['title'] as String,
        subtitle: json['subtitle'] as String?,
        bodyContent: json['body_content'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'page_key': pageKey,
        'title': title,
        'subtitle': subtitle,
        'body_content': bodyContent,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
