import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_games_app/app/modules/games/domain/entities/games_entity.dart';
import 'package:my_games_app/app/modules/games/domain/repositories/games_repository.dart';
import 'package:my_games_app/app/modules/games/domain/usecases/games_usecase.dart';
import 'package:my_games_app/app/modules/games/errors/games_errors.dart';

class GamesRepositoryMock extends Mock implements IGamesRepository {}

void main() {
  final repository = GamesRepositoryMock();
  final usecase = GamesUsecase(repository);

  test('Deve retornar uma lista de GamesEntity', () async {
    when(() => repository.showGames())
        .thenAnswer((_) async => const Right(<GamesEntity>[]));
    final result = await usecase();
    expect(result.fold((l) => l, (r) => r), isA<List<GamesEntity>>());
  });
  test('Deve retornar um ShowGamesErrors em caso de falha', () async {
    when(() => repository.showGames()).thenThrow(ShowGamesErrors());
    final result = await usecase();
    expect(result.fold((l) => l, (r) => r), isA<ShowGamesErrors>());
  });
}
