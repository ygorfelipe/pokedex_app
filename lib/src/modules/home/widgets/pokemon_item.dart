import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../model/pokemon/pokemon_model.dart';
import '../details/pokemon_detail_controller.dart';

class PokemonItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<PokemonDetailController>().loadPokemon(pokemon.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey[100]!),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    pokemon.img,
                  ),
                ),
                Text(
                  'Nº ${pokemon.number}',
                  style:
                      context.textStyles.textBold.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        pokemon.type.map((p) => TypeInfo(type: p)).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  pokemon.name,
                  style: context.textStyles.textTitle.copyWith(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TypeInfo extends StatelessWidget {
  final String type;
  const TypeInfo({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      type.toString(),
      style: context.textStyles.textRegular.copyWith(),
    );
  }
}
