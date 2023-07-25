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

  late final _$_imgAtom =
      Atom(name: 'PokemonDetailControllerBase._img', context: context);

  String? get img {
    _$_imgAtom.reportRead();
    return super._img;
  }

  @override
  String? get _img => img;

  @override
  set _img(String? value) {
    _$_imgAtom.reportWrite(value, super._img, () {
      super._img = value;
    });
  }

  late final _$_numberAtom =
      Atom(name: 'PokemonDetailControllerBase._number', context: context);

  String? get number {
    _$_numberAtom.reportRead();
    return super._number;
  }

  @override
  String? get _number => number;

  @override
  set _number(String? value) {
    _$_numberAtom.reportWrite(value, super._number, () {
      super._number = value;
    });
  }

  late final _$_nameAtom =
      Atom(name: 'PokemonDetailControllerBase._name', context: context);

  String? get name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  String? get _name => name;

  @override
  set _name(String? value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
    });
  }

  late final _$_heightAtom =
      Atom(name: 'PokemonDetailControllerBase._height', context: context);

  String? get height {
    _$_heightAtom.reportRead();
    return super._height;
  }

  @override
  String? get _height => height;

  @override
  set _height(String? value) {
    _$_heightAtom.reportWrite(value, super._height, () {
      super._height = value;
    });
  }

  late final _$_weightAtom =
      Atom(name: 'PokemonDetailControllerBase._weight', context: context);

  String? get weight {
    _$_weightAtom.reportRead();
    return super._weight;
  }

  @override
  String? get _weight => weight;

  @override
  set _weight(String? value) {
    _$_weightAtom.reportWrite(value, super._weight, () {
      super._weight = value;
    });
  }

  late final _$_typeAtom =
      Atom(name: 'PokemonDetailControllerBase._type', context: context);

  List<dynamic> get type {
    _$_typeAtom.reportRead();
    return super._type;
  }

  @override
  List<dynamic> get _type => type;

  @override
  set _type(List<dynamic> value) {
    _$_typeAtom.reportWrite(value, super._type, () {
      super._type = value;
    });
  }

  late final _$_weaknessesAtom =
      Atom(name: 'PokemonDetailControllerBase._weaknesses', context: context);

  List<dynamic> get weaknesses {
    _$_weaknessesAtom.reportRead();
    return super._weaknesses;
  }

  @override
  List<dynamic> get _weaknesses => weaknesses;

  @override
  set _weaknesses(List<dynamic> value) {
    _$_weaknessesAtom.reportWrite(value, super._weaknesses, () {
      super._weaknesses = value;
    });
  }

  late final _$_candyAtom =
      Atom(name: 'PokemonDetailControllerBase._candy', context: context);

  String? get candy {
    _$_candyAtom.reportRead();
    return super._candy;
  }

  @override
  String? get _candy => candy;

  @override
  set _candy(String? value) {
    _$_candyAtom.reportWrite(value, super._candy, () {
      super._candy = value;
    });
  }

  late final _$_spawnChanceAtom =
      Atom(name: 'PokemonDetailControllerBase._spawnChance', context: context);

  num? get spawnChance {
    _$_spawnChanceAtom.reportRead();
    return super._spawnChance;
  }

  @override
  num? get _spawnChance => spawnChance;

  @override
  set _spawnChance(num? value) {
    _$_spawnChanceAtom.reportWrite(value, super._spawnChance, () {
      super._spawnChance = value;
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
