import '../models/games_model.dart';

abstract class IGamesDatasource {
  Future<List<GamesModel>> showGames();
}
