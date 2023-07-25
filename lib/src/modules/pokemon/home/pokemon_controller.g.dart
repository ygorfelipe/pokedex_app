// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonController on PokemonControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'PokemonControllerBase._status', context: context);

  PokemonStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  PokemonStateStatus get _status => status;

  @override
  set _status(PokemonStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_pokemonAtom =
      Atom(name: 'PokemonControllerBase._pokemon', context: context);

  List<PokemonModel> get pokemon {
    _$_pokemonAtom.reportRead();
    return super._pokemon;
  }

  @override
  List<PokemonModel> get _pokemon => pokemon;

  @override
  set _pokemon(List<PokemonModel> value) {
    _$_pokemonAtom.reportWrite(value, super._pokemon, () {
      super._pokemon = value;
    });
  }

  late final _$_filterByAzAtom =
      Atom(name: 'PokemonControllerBase._filterByAz', context: context);

  String? get filterByAz {
    _$_filterByAzAtom.reportRead();
    return super._filterByAz;
  }

  @override
  String? get _filterByAz => filterByAz;

  @override
  set _filterByAz(String? value) {
    _$_filterByAzAtom.reportWrite(value, super._filterByAz, () {
      super._filterByAz = value;
    });
  }

  late final _$_pokemonSelectedAtom =
      Atom(name: 'PokemonControllerBase._pokemonSelected', context: context);

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

  late final _$loadPokemonsAsyncAction =
      AsyncAction('PokemonControllerBase.loadPokemons', context: context);

  @override
  Future<void> loadPokemons() {
    return _$loadPokemonsAsyncAction.run(() => super.loadPokemons());
  }

  late final _$getPokemonAsyncAction =
      AsyncAction('PokemonControllerBase.getPokemon', context: context);

  @override
  Future<void> getPokemon(PokemonModel pokemonModel) {
    return _$getPokemonAsyncAction.run(() => super.getPokemon(pokemonModel));
  }

  late final _$PokemonControllerBaseActionController =
      ActionController(name: 'PokemonControllerBase', context: context);

  @override
  void changeFilter(String? byAz) {
    final _$actionInfo = _$PokemonControllerBaseActionController.startAction(
        name: 'PokemonControllerBase.changeFilter');
    try {
      return super.changeFilter(byAz);
    } finally {
      _$PokemonControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
