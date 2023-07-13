// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailController on PokemonDetailControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'PokemonDetailControllerBase._status', context: context);

  PokemonDetailStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  PokemonDetailStateStatus get _status => status;

  @override
  set _status(PokemonDetailStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'PokemonDetailControllerBase._errorMessage', context: context);

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

  late final _$_pokemonModelAtom =
      Atom(name: 'PokemonDetailControllerBase._pokemonModel', context: context);

  PokemonModel? get pokemonModel {
    _$_pokemonModelAtom.reportRead();
    return super._pokemonModel;
  }

  @override
  PokemonModel? get _pokemonModel => pokemonModel;

  @override
  set _pokemonModel(PokemonModel? value) {
    _$_pokemonModelAtom.reportWrite(value, super._pokemonModel, () {
      super._pokemonModel = value;
    });
  }

  late final _$loadPokemonAsyncAction =
      AsyncAction('PokemonDetailControllerBase.loadPokemon', context: context);

  @override
  Future<void> loadPokemon(int? id) {
    return _$loadPokemonAsyncAction.run(() => super.loadPokemon(id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
