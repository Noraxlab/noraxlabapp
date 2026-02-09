import 'dart:core';

class ContentItem {
  String id;
  String title;
  String description;
  String imageUrl;
  String downloadLink;
  String category;
  int views;
  int downloads;
  DateTime createdAt;
  DateTime updatedAt;
  bool isFeatured;
  String? fileSize;
  String? version;
  List<String> tags;

  ContentItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.downloadLink,
    required this.category,
    this.views = 0,
    this.downloads = 0,
    required this.createdAt,
    required this.updatedAt,
    this.isFeatured = false,
    this.fileSize,
    this.version,
    this.tags = const [],
  });

  factory ContentItem.fromMap(Map<String, dynamic> map, String id) {
    return ContentItem(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      downloadLink: map['downloadLink'] ?? '',
      category: map['category'] ?? '',
      views: map['views'] ?? 0,
      downloads: map['downloads'] ?? 0,
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(map['updatedAt'] ?? DateTime.now().toIso8601String()),
      isFeatured: map['isFeatured'] ?? false,
      fileSize: map['fileSize'],
      version: map['version'],
      tags: List<String>.from(map['tags'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'downloadLink': downloadLink,
      'category': category,
      'views': views,
      'downloads': downloads,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isFeatured': isFeatured,
      'fileSize': fileSize,
      'version': version,
      'tags': tags,
    };
  }

  String getFormattedDate() {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}

class AppUpdate {
  String version;
  String updateLink;
  String updateMessage;
  bool forceUpdate;
  DateTime releaseDate;

  AppUpdate({
    required this.version,
    required this.updateLink,
    required this.updateMessage,
    required this.forceUpdate,
    required this.releaseDate,
  });

  factory AppUpdate.fromMap(Map<String, dynamic> map) {
    return AppUpdate(
      version: map['version'] ?? '',
      updateLink: map['updateLink'] ?? '',
      updateMessage: map['updateMessage'] ?? '',
      forceUpdate: map['forceUpdate'] ?? false,
      releaseDate: DateTime.parse(map['releaseDate'] ?? DateTime.now().toIso8601String()),
    );
  }
}
