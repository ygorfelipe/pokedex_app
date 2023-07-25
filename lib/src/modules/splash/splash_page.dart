import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Loader, Messages {
  final controller = Modular.get<SplashController>();
  late final ReactionDisposer statusReactionDisposer;

  @override
  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => controller.splashStatus,
      (status) {
        switch (status) {
          case SplashStateStatus.initial:
            break;
          case SplashStateStatus.loading:
            showLoader();
            break;
          case SplashStateStatus.success:
            hideLoader();

            break;
          case SplashStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.black,
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: context.percentHeight(.4),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wallpaper-login.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //! logo acima do form
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: context.percentWidth(.4),
              padding: EdgeInsets.only(top: context.percentHeight(.10)),
              child: Image.asset('assets/images/pokeball-logo.png'),
            ),
          ),
          const SizedBox(height: 50),

          Center(
            child: SizedBox(
              width: context.percentWidth(.6),
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Modular.to.navigate('/pokemon/');
                },
                child: const Text('Acessar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
