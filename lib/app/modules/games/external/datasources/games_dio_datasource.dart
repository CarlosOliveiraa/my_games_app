import 'package:dio/dio.dart';

import 'package:my_games_app/app/modules/games/errors/games_errors.dart';
import 'package:my_games_app/app/modules/games/infra/datasources/games_datasource.dart';
import 'package:my_games_app/app/modules/games/infra/models/games_model.dart';

class GamesDioDatasource implements IGamesDatasource {
  final Dio dio;

  GamesDioDatasource(this.dio);

  @override
  Future<List<GamesModel>> showGames() async {
    try {
      final response = await dio.get("https://www.freetogame.com/api/games");
      final list =
          (response.data as List).map((e) => GamesModel.fromMap(e)).toList();

      return list;
    } on DioError catch (e) {
      throw DioDatasourceErrors(message: "Error: $e");
    }
  }
}
