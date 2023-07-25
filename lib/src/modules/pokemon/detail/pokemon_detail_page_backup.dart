// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:mobx/mobx.dart';

// import '../../../core/ui/helpers/loader.dart';
// import '../../../core/ui/helpers/messages.dart';
// import '../../../core/ui/helpers/size_extensions.dart';
// import '../../../core/ui/styles/text_styles.dart';
// import 'pokemon_detail_controller.dart';

// class PokemonDetailPageBackUp extends StatefulWidget {
//   final int? pokemonId;

//   const PokemonDetailPageBackUp({super.key, required this.pokemonId});

//   @override
//   State<PokemonDetailPageBackUp> createState() =>
//       _PokemonDetailPageBackUpState();
// }

// class _PokemonDetailPageBackUpState extends State<PokemonDetailPageBackUp>
//     with Loader, Messages {
//   final controller = Modular.get<PokemonDetailController>();

//   late final String img;
//   late final String name;
//   late final String number;
//   late final List type;

//   @override
//   void initState() {
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
//             final model = controller.pokemonModel!;
//             log(model.toString());
//             img = model.img;
//             name = model.name;
//             number = model.number;
//             type = model.type;
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
//       super.initState();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Details Pokemon'),
//       ),
//       body: Card(
//         margin: const EdgeInsets.all(16),
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(color: Colors.grey[100]!),
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               //! aqui devo colocar o shimmer, inclusive adicionar o hiver para poder salvar as imagens em cache
//               //! ou utilizar o cache network
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.arrow_left),
//                   ),
//                   Text(
//                     'Next Evolution',
//                     style: context.textStyles.textTitle.copyWith(fontSize: 18),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.arrow_right),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: context.percentWidth(0.7),
//                 height: context.percentHeight(0.3),
//                 child: Image.network(
//                   img,
//                   fit: BoxFit.contain,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Image.asset('assets/images/pokeball-logo.png');
//                   },
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 'Nº $number',
//                 style: context.textStyles.textBold
//                     .copyWith(color: Colors.grey, fontSize: 18),
//               ),
//               const Divider(thickness: 2),
//               Text(
//                 name,
//                 style: context.textStyles.textTitle.copyWith(fontSize: 18),
//                 overflow: TextOverflow.ellipsis,
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 height: context.screenHeight * 0.16,
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'Height',
//                               style: context.textStyles.textBold
//                                   .copyWith(fontSize: 18),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             Text(
//                               '0.41 m',
//                               style: context.textStyles.textMedium
//                                   .copyWith(fontSize: 16),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(height: 18),
//                             Text(
//                               'Weight',
//                               style: context.textStyles.textBold
//                                   .copyWith(fontSize: 18),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             Text(
//                               '4.0 kg',
//                               style: context.textStyles.textMedium
//                                   .copyWith(fontSize: 16),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               'Candy',
//                               style: context.textStyles.textBold
//                                   .copyWith(fontSize: 18),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             Text(
//                               'candy',
//                               style: context.textStyles.textMedium
//                                   .copyWith(fontSize: 16),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(height: 18),
//                             Text(
//                               'Spawn Chance',
//                               style: context.textStyles.textBold
//                                   .copyWith(fontSize: 18),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             Text(
//                               'N/A',
//                               style: context.textStyles.textMedium
//                                   .copyWith(fontSize: 16),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[100]!),
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         'Tipo: ',
//                         style:
//                             context.textStyles.textTitle.copyWith(fontSize: 18),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       type.join('\n'),
//                       style:
//                           context.textStyles.textMedium.copyWith(fontSize: 17),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[100]!),
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         'weaknesses: ',
//                         style:
//                             context.textStyles.textTitle.copyWith(fontSize: 18),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       'pokemon.weaknesses.join()',
//                       style:
//                           context.textStyles.textMedium.copyWith(fontSize: 15),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
