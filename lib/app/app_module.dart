import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_games_app/app/modules/games/domain/usecases/games_usecase.dart';
import 'package:my_games_app/app/modules/games/external/datasources/games_dio_datasource.dart';
import 'package:my_games_app/app/modules/games/infra/repositories/games_repository_impl.dart';
import 'package:my_games_app/app/modules/games/presenters/triples/games_store.dart';

import 'modules/games/games_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => GamesDioDatasource(i())),
    Bind((i) => GamesRepositoryImpl(i())),
    Bind((i) => GamesUsecase(i())),
    Bind((i) => GamesStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: GamesModule()),
  ];
}
