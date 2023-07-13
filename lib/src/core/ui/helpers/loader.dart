import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  //* ver se o load esta aberto ou não
  var isOpen = false;

  //* utilizando o packge de loader_animation
  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        //! aqi so sera fechado pelo navigate, pode morrer de clicar fora do loader que ele não ira sair
        barrierDismissible: false,
        context: context,
        builder: (context) {
          //! procurar outro loader caso necewssario
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 30.0,
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  //* irá garantir que irá sair o loader da tela, por questão de segurança
  @override
  void dispose() {
    hideLoader();
    super.dispose();
  }
}
