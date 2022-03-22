import 'package:dartz/dartz.dart';

import '../../errors/games_errors.dart';
import '../entities/games_entity.dart';

abstract class IGamesRepository {
  Future<Either<GamesErrors, List<GamesEntity>>> showGames();
}
