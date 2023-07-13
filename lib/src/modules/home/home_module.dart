import 'package:flutter_modular/flutter_modular.dart';

import 'details/pokemon_detail.dart';
import 'details/pokemon_detail_controller.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeController(i())),
        Bind.lazySingleton((i) => PokemonDetailController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/detail',
          child: (context, args) => PokemonDetail(
            pokemonId:
                int.tryParse(args.queryParams['id'] ?? 'id não informado'),
          ),
        ),
      ];
}
