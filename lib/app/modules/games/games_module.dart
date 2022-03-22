import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_games_app/app/modules/games/presenters/pages/games_page.dart';
import 'package:my_games_app/app/modules/games/presenters/triples/games_store.dart';



 
class GamesModule extends Module {
  @override
  final List<Bind> binds = [
 Bind.lazySingleton((i) => GamesStore(i())),
 ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => const GamesPage()),
 ];
}