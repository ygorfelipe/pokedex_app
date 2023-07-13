import 'dart:developer';

import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

enum SplashStateStatus {
  initial,
  loading,
  success,
  error;
}

class SplashController = SplashControllerBase with _$SplashController;

abstract class SplashControllerBase with Store {
  @readonly
  var _splashStatus = SplashStateStatus.initial;

  @readonly
  String? _errorMessage;

  @action
  Future<void> accessPreview() async {
    try {
      _splashStatus = SplashStateStatus.loading;
      await Future.delayed(const Duration(seconds: 3));
      _splashStatus = SplashStateStatus.success;
    } catch (e, s) {
      log('Erro ao acessar dados', error: e, stackTrace: s);
      _errorMessage = 'Erro ao acessar Aplicativo';
    }
  }
}
