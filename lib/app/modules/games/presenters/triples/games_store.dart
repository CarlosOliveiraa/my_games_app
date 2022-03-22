import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_games_app/app/modules/games/domain/usecases/games_usecase.dart';
import 'package:my_games_app/app/modules/games/presenters/triples/games_state.dart';

class GamesStore extends StreamStore<Exception, GamesSuccess> {
  final IGamesUsecase usecase;

  GamesStore(this.usecase) : super(GamesSuccess(games: []));

  Future<void> showGames() async {
    setLoading(true);

    final result = await usecase();
    result.fold((l) {
      setError(l);
      setLoading(false);
    }, (r) => update(GamesSuccess(games: r)));
  }
}
