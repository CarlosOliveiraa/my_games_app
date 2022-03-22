import 'package:dartz/dartz.dart';
import 'package:my_games_app/app/modules/games/domain/entities/games_entity.dart';

import '../../errors/games_errors.dart';
import '../repositories/games_repository.dart';

abstract class IGamesUsecase {
  Future<Either<GamesErrors, List<GamesEntity>>> call();
}

class GamesUsecase implements IGamesUsecase {
  final IGamesRepository repository;

  GamesUsecase(this.repository);

  @override
  Future<Either<GamesErrors, List<GamesEntity>>> call() async {
    try {
      final result = await repository.showGames();
      return result;
    } on ShowGamesErrors catch (e) {
      return Left(e);
    }
  }
}
