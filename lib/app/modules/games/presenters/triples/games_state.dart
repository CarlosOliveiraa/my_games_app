import '../../domain/entities/games_entity.dart';

abstract class GamesStates {}

class GamesSuccess implements GamesStates {
  final List<GamesEntity> games;

  GamesSuccess({required this.games});
}
