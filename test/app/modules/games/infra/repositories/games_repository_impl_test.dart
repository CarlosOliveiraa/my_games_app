import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_games_app/app/modules/games/domain/entities/games_entity.dart';
import 'package:my_games_app/app/modules/games/errors/games_errors.dart';
import 'package:my_games_app/app/modules/games/infra/datasources/games_datasource.dart';
import 'package:my_games_app/app/modules/games/infra/models/games_model.dart';
import 'package:my_games_app/app/modules/games/infra/repositories/games_repository_impl.dart';


class GamesDatasourceMock extends Mock implements IGamesDatasource{}

void main() {

  final datasource = GamesDatasourceMock();
  final repository = GamesRepositoryImpl(datasource);
  final List<GamesModel> games = [];
  test('Deve retornar um modelo em caso de sucesso', () async {
    when(() => datasource.showGames()).thenAnswer((_) async =>  games);
    final result = await repository.showGames();
    expect(result.fold((l) => l, (r) => r), isA<List<GamesModel>>());
  });
  test('Deve retornar um erro no Datasource', () async {
    when(() => datasource.showGames()).thenThrow(DatasourceErrors());
    final result = await repository.showGames();
    expect(result.fold((l) => l, (r) => r), isA<DatasourceErrors>());
  });

}