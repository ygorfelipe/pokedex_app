import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../repositories/pokemons/pokemon_repository.dart';
import '../../repositories/pokemons/pokemon_repository_impl.dart';
import '../../services/pokemons/pokemon_service.dart';
import '../../services/pokemons/pokemon_service_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => CustomDio(),
          export: true,
        ),
        Bind.lazySingleton<PokemonRepository>((i) => PokemonRepositoryImpl(i()),
            export: true),
        Bind.lazySingleton<PokemonService>((i) => PokemonServiceImpl(i()),
            export: true),
      ];
}
