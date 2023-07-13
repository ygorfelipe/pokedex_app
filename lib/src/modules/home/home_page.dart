import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'home_controller.dart';
import 'widgets/pokemon_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  final controller = Modular.get<HomeController>();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case HomeStateStatus.initial:
            break;
          case HomeStateStatus.loading:
            showLoader();
            break;
          case HomeStateStatus.loaded:
            hideLoader();
            break;
          case HomeStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro ao buscar Pokemons');
            break;
          case HomeStateStatus.selectedPokemon:
            hideLoader();

            final pokemonSelected = controller.pokemonSelected;
            var uri = '/home/detail';
            if (pokemonSelected != null) {
              uri += '?id${pokemonSelected.id}';
            }
            await Modular.to.pushNamed(uri);
            controller.loadPokemon();
            break;
        }
      });
      controller.loadPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Observer(builder: (_) {
        return GridView.builder(
          itemCount: controller.pokemons.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 300,
            mainAxisSpacing: 0,
            maxCrossAxisExtent: 300,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            final pokemonModel = controller.pokemons[index];
            return PokemonItem(pokemon: pokemonModel);
          },
        );
      }),
    );
  }
}
