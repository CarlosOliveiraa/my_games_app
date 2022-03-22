import 'package:my_games_app/app/modules/games/domain/entities/games_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:my_games_app/app/modules/games/domain/repositories/games_repository.dart';
import 'package:my_games_app/app/modules/games/errors/games_errors.dart';
import 'package:my_games_app/app/modules/games/infra/datasources/games_datasource.dart';

class GamesRepositoryImpl implements IGamesRepository{

  final IGamesDatasource datasource;

  GamesRepositoryImpl(this.datasource);

  @override
  Future<Either<GamesErrors, List<GamesEntity>>> showGames() async {
    try {
      final result = await datasource.showGames();
      return Right(result);
    } on DatasourceErrors catch (e) {
      return Left(e);
    }
  }

}