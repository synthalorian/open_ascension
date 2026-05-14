import 'package:flutter/foundation.dart';

@immutable
class DungeonRouteImage {
  final String id;
  final String dungeonId;
  final String imageUrl;
  final String? caption;
  final int? sortOrder;
  final String? createdAt;

  const DungeonRouteImage({
    required this.id,
    required this.dungeonId,
    required this.imageUrl,
    this.caption,
    this.sortOrder,
    this.createdAt,
  });

  factory DungeonRouteImage.fromJson(Map<String, dynamic> json) =>
      DungeonRouteImage(
        id: json['id'] as String,
        dungeonId: json['dungeon_id'] as String,
        imageUrl: json['image_url'] as String,
        caption: json['caption'] as String?,
        sortOrder: json['sort_order'] as int?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dungeon_id': dungeonId,
        'image_url': imageUrl,
        'caption': caption,
        'sort_order': sortOrder,
        'created_at': createdAt,
      };
}
