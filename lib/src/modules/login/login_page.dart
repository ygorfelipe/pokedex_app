import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenShortestSide = context.screenShortestSide;

    return Scaffold(
      backgroundColor: context.colors.black,
      body: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: screenShortestSide * .5,
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
              width: screenShortestSide * .4,
              padding: EdgeInsets.only(top: context.percentHeight(.10)),
              child: Image.asset('assets/images/pokeball-logo.png'),
            ),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: context.percentWidth(.7),
                maxHeight: context.percentHeight(.4),
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //! aqui seria a logo acima do Login
                    // FractionallySizedBox(
                    //   widthFactor: .4,
                    //   child: Image.asset('assets/images/pokeball-logo.png'),
                    // ),
                    // const SizedBox(height: 20),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Login',
                        style: context.textStyles.textTitle
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: context.percentHeight(.05),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('E-mail'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: context.percentHeight(.05),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Senha'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: context.percentWidth(.6),
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Entrar'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
