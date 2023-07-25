import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/text_styles.dart';
import 'pokemon_detail_controller.dart';

class PokemonDetailPage extends StatefulWidget {
  final int? pokemonId;

  const PokemonDetailPage({super.key, required this.pokemonId});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage>
    with Loader, Messages {
  final controller = Modular.get<PokemonDetailController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case PokemonDetailStateStatus.initial:
            break;
          case PokemonDetailStateStatus.loading:
            showLoader();
            break;
          case PokemonDetailStateStatus.loaded:
            hideLoader();
            log(controller.pokemonModel!.toString());
            hideLoader();
            break;
          case PokemonDetailStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
          case PokemonDetailStateStatus.errorLoadPokemon:
            hideLoader();
            showError('Erro ao carregar o Pokemon');
            Navigator.pop(context);
            break;
        }
      });
      controller.loadPokemon(widget.pokemonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    const double fontSize18 = 18.0;
    const double fontSize20 = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Pokemon'),
      ),
      body: Observer(
        builder: (context) {
          return Card(
            margin: const EdgeInsets.all(16),
            elevation: 10,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[100]!),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  //! aqui devo colocar o shimmer, inclusive adicionar o hiver para poder salvar as imagens em cache
                  //! ou utilizar o cache network
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_left),
                      ),
                      Text(
                        'Next Evolution',
                        style: context.textStyles.textTitle
                            .copyWith(fontSize: fontSize18),
                        overflow: TextOverflow.ellipsis,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: context.percentWidth(0.6),
                    height: context.percentHeight(0.3),
                    child: Image.network(
                      controller.img ?? '',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/pokeball-logo.png');
                      },
                    ),
                  ),
                  Text(
                    'Nº ${controller.number ?? 'Numero'}',
                    style: context.textStyles.textTitle
                        .copyWith(fontSize: fontSize20),
                  ),
                  const SizedBox(height: 6),
                  const Divider(thickness: 2),
                  const SizedBox(height: 6),
                  Text(
                    controller.name ?? 'Nome',
                    style: context.textStyles.textTitle
                        .copyWith(fontSize: fontSize20),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Altura',
                                  style: context.textStyles.textBold
                                      .copyWith(fontSize: fontSize20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.height ?? 'Altura',
                                  style: context.textStyles.textMedium
                                      .copyWith(fontSize: fontSize18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Peso',
                                  style: context.textStyles.textBold
                                      .copyWith(fontSize: fontSize20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.weight ?? 'Peso',
                                  style: context.textStyles.textMedium
                                      .copyWith(fontSize: fontSize18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Candy',
                                  style: context.textStyles.textBold
                                      .copyWith(fontSize: fontSize20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.candy ?? 'Candy',
                                  style: context.textStyles.textMedium
                                      .copyWith(fontSize: fontSize18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Spawn Chance',
                                  style: context.textStyles.textBold
                                      .copyWith(fontSize: fontSize20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${controller.spawnChance ?? 'Spawn Chance'}%',
                                  style: context.textStyles.textMedium
                                      .copyWith(fontSize: fontSize18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(thickness: 2),
                        const SizedBox(height: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tipo: ',
                                  style: context.textStyles.textTitle
                                      .copyWith(fontSize: fontSize20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  controller.type.join(' - '),
                                  style: context.textStyles.textMedium
                                      .copyWith(fontSize: fontSize18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Pontos Fracos: ',
                                  style: context.textStyles.textTitle
                                      .copyWith(fontSize: fontSize20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  controller.weaknesses.join(' - '),
                                  style: context.textStyles.textMedium
                                      .copyWith(fontSize: fontSize18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
