import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'widgets/pokemon_card.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/base_header.dart';
import 'pokemon_controller.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> with Loader, Messages {
  final controller = Modular.get<PokemonController>();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case PokemonStateStatus.initial:
            break;
          case PokemonStateStatus.loading:
            showLoader();
            break;
          case PokemonStateStatus.loaded:
            hideLoader();
            break;
          case PokemonStateStatus.error:
            hideLoader();
            showError('Erro ao buscar pokemon');
            break;
          case PokemonStateStatus.selectedPokemon:
            final pokemonSelected = controller.pokemonSelected;
            var uri = '/pokemon/pokemon-detail';
            if (pokemonSelected != null) {
              uri += '?id=${pokemonSelected.id}';
            }
            Modular.to.pushNamed(uri);
            hideLoader();
            break;
        }
      });
      controller.loadPokemons();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PokeDex'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: BaseHeader(
                title: '',
                buttonLabel: '',
                buttonPressed: () {},
                filterWidget: PopupMenuButton<bool>(
                  initialValue: null,
                  onSelected: (value) {},
                  itemBuilder: (context) => [
                    const PopupMenuItem<bool>(
                      value: true,
                      child: Text('a-z'),
                    ),
                    const PopupMenuItem<bool>(
                      value: null,
                      child: Text('z-a'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Observer(builder: (_) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.pokemon.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 300,
                  mainAxisSpacing: 0,
                  maxCrossAxisExtent: 300,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: PokemonCard(
                      pokemon: controller.pokemon[index],
                    ),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }

  // Observer _findPokemon() {
  //   return Observer(builder: (_) {
  //           return GridView.builder(
  //             itemCount: controller.pokemon.length,
  //             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  //               mainAxisExtent: 300,
  //               mainAxisSpacing: 0,
  //               maxCrossAxisExtent: 300,
  //               crossAxisSpacing: 0,
  //             ),
  //             itemBuilder: (context, index) {
  //               return PokemonCard(
  //                 pokemon: controller.pokemon[index],
  //               );
  //             },
  //           );
  //         });
  // }
}
