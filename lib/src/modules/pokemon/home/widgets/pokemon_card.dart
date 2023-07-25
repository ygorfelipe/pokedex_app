import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/ui/styles/text_styles.dart';
import '../../../../model/pokemon/pokemon_model.dart';
import '../pokemon_controller.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[100]!),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
          // Modular.to.pushNamed('/pokemon/pokemon-detail/${pokemon.id}');
          context.read<PokemonController>().getPokemon(pokemon);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              //! aqui devo colocar o shimmer, inclusive adicionar o hiver para poder salvar as imagens em cache
              //! ou utilizar o cache network
              Expanded(
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/pokeball-logo.png');
                  },
                ),
              ),
              Text(
                'Nº ${pokemon.number}',
                style: context.textStyles.textBold.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[100]!),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Tipo: ',
                        style:
                            context.textStyles.textTitle.copyWith(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      pokemon.type.join('\n'),
                      style:
                          context.textStyles.textMedium.copyWith(fontSize: 17),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
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
    );
  }
}
