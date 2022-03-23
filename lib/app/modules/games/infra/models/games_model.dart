import 'dart:convert';

import 'package:my_games_app/app/modules/games/domain/entities/games_entity.dart';

class GamesModel implements GamesEntity {
  @override
  final int id;
  @override
  final String title;
  @override
  final String thumbnail;
  @override
  final String gnre;
  @override
  final String platform;
  @override
  final String releaseDate;

  GamesModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.gnre,
    required this.platform,
    required this.releaseDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'gnre': gnre,
      'platform': platform,
    };
  }

  factory GamesModel.fromMap(Map<String, dynamic> map) {
    return GamesModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      gnre: map['gnre'] ?? '',
      platform: map['platform'] ?? '',
      releaseDate: map['release_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GamesModel.fromJson(String source) => GamesModel.fromMap(json.decode(source));
}
