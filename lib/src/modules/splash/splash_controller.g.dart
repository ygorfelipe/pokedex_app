// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashController on SplashControllerBase, Store {
  late final _$_splashStatusAtom =
      Atom(name: 'SplashControllerBase._splashStatus', context: context);

  SplashStateStatus get splashStatus {
    _$_splashStatusAtom.reportRead();
    return super._splashStatus;
  }

  @override
  SplashStateStatus get _splashStatus => splashStatus;

  @override
  set _splashStatus(SplashStateStatus value) {
    _$_splashStatusAtom.reportWrite(value, super._splashStatus, () {
      super._splashStatus = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'SplashControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$accessPreviewAsyncAction =
      AsyncAction('SplashControllerBase.accessPreview', context: context);

  @override
  Future<void> accessPreview() {
    return _$accessPreviewAsyncAction.run(() => super.accessPreview());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
