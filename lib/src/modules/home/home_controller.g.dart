// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'HomeControllerBase._status', context: context);

  HomeStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  HomeStateStatus get _status => status;

  @override
  set _status(HomeStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_pokemonsAtom =
      Atom(name: 'HomeControllerBase._pokemons', context: context);

  List<PokemonModel> get pokemons {
    _$_pokemonsAtom.reportRead();
    return super._pokemons;
  }

  @override
  List<PokemonModel> get _pokemons => pokemons;

  @override
  set _pokemons(List<PokemonModel> value) {
    _$_pokemonsAtom.reportWrite(value, super._pokemons, () {
      super._pokemons = value;
    });
  }

  late final _$_pokemonSelectedAtom =
      Atom(name: 'HomeControllerBase._pokemonSelected', context: context);

  PokemonModel? get pokemonSelected {
    _$_pokemonSelectedAtom.reportRead();
    return super._pokemonSelected;
  }

  @override
  PokemonModel? get _pokemonSelected => pokemonSelected;

  @override
  set _pokemonSelected(PokemonModel? value) {
    _$_pokemonSelectedAtom.reportWrite(value, super._pokemonSelected, () {
      super._pokemonSelected = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'HomeControllerBase._errorMessage', context: context);

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

  late final _$loadPokemonAsyncAction =
      AsyncAction('HomeControllerBase.loadPokemon', context: context);

  @override
  Future<void> loadPokemon() {
    return _$loadPokemonAsyncAction.run(() => super.loadPokemon());
  }

  late final _$getPokemonAsyncAction =
      AsyncAction('HomeControllerBase.getPokemon', context: context);

  @override
  Future<void> getPokemon(PokemonModel pokemonModel) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(pokemonModel));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
