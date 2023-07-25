// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';

// import '../../../core/ui/helpers/loader.dart';
// import '../../../core/ui/helpers/messages.dart';
// import '../../../core/ui/styles/colors_app.dart';
// import '../../../core/ui/styles/text_styles.dart';
// import 'pokemon_detail_controller.dart';

// class PokemonDetailPage extends StatefulWidget {
//   final int? pokemonId;
//   const PokemonDetailPage({super.key, required this.pokemonId});

//   @override
//   State<PokemonDetailPage> createState() => _PokemonDetailState();
// }

// class _PokemonDetailState extends State<PokemonDetailPage>
//     with Loader, Messages {
//   final controller = Modular.get<PokemonDetailController>();
//   late final String img;
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       reaction((_) => controller.status, (status) {
//         switch (status) {
//           case PokemonDetailStateStatus.initial:
//             break;
//           case PokemonDetailStateStatus.loading:
//             showLoader();
//             break;
//           case PokemonDetailStateStatus.loaded:
//             hideLoader();
//             //* populando os dadas carregados
//             final model = controller.pokemonModel!;
//             img = model.img;
//             hideLoader();
//             break;
//           case PokemonDetailStateStatus.error:
//             hideLoader();
//             showError(controller.errorMessage!);
//             break;
//           case PokemonDetailStateStatus.errorLoadPokemon:
//             hideLoader();
//             showError('Erro ao carregar o Pokemon');
//             Navigator.pop(context);
//             break;
//         }
//       });
//       controller.loadPokemon(widget.pokemonId);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Details'),
//       ),
//       body: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(color: Colors.grey[100]!),
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               Expanded(
//                 child: Image.network(img),
//               ),
//               Text(
//                 'Nº numero',
//                 style: context.textStyles.textBold.copyWith(color: Colors.grey),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: context.colors.black),
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text('INFO TAL'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'name',
//                 style: context.textStyles.textTitle.copyWith(fontSize: 18),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
