import 'package:flutter_modular/flutter_modular.dart';
import 'detail/pokemon_detail_controller.dart';
import 'detail/pokemon_detail_page.dart';
import 'home/pokemon_controller.dart';
import 'home/pokemon_page.dart';

class PokemonModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => PokemonController(i()),
    ),
    Bind.lazySingleton((i) => PokemonDetailController(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PokemonPage()),
    ChildRoute('/pokemon-detail',
        child: (_, args) => PokemonDetailPage(
              pokemonId: int.tryParse(args.queryParams['id'] ?? 'id não informado'),
            )),
  ];
}
