abstract class GamesErrors implements Exception {}

class ShowGamesErrors implements GamesErrors {}

class DatasourceErrors implements GamesErrors {}

class DioDatasourceErrors implements GamesErrors {
  final String message;

  DioDatasourceErrors({required this.message});
}
