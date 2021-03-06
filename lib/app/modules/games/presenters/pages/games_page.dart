import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_games_app/app/modules/games/presenters/pages/components/custom_cards_games.dart';
import 'package:my_games_app/app/modules/games/presenters/triples/games_state.dart';
import 'package:my_games_app/app/modules/games/presenters/triples/games_store.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final store = Modular.get<GamesStore>();

  @override
  void initState() {
    super.initState();
    store.showGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Games"),
        centerTitle: true,
      ),
      // body:  Center(
      //   child: CustomCardsGames(
      //     width: 302,
      //     height: 192,
      //   ),
      // ),
      body: ScopedBuilder<GamesStore, Exception, GamesSuccess>(
        onError: (_, Exception? e) => Text("$e"),
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onState: (_, GamesSuccess state) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 192,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.games.length,
                itemBuilder: (context, index) {
                  return CustomCardsGames(
                    games: state.games[index],
                  );
                  // return ListTile(
                  //   title: Text(state.games[index].title),
                  // );
                }),
          );
        },
      ),
    );
  }
}
