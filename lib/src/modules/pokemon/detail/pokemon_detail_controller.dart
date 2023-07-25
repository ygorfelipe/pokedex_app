import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../model/pokemon/pokemon_model.dart';
import '../../../services/pokemons/pokemon_service.dart';
part 'pokemon_detail_controller.g.dart';

enum PokemonDetailStateStatus {
  initial,
  loading,
  loaded,
  errorLoadPokemon,
  error;
}

class PokemonDetailController = PokemonDetailControllerBase
    with _$PokemonDetailController;

abstract class PokemonDetailControllerBase with Store {
  final PokemonService _service;

  PokemonDetailControllerBase(this._service);

  @readonly
  var _status = PokemonDetailStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  PokemonModel? _pokemonModel;

  @readonly
  String? _img;

  @readonly
  String? _number;

  @readonly
  String? _name;

  @readonly
  String? _height;

  @readonly
  String? _weight;

  @readonly
  var _type = [];

  @readonly
  var _weaknesses = [];

  @readonly
  String? _candy;

  @readonly
  num? _spawnChance;

  @action
  Future<void> loadPokemon(int? id) async {
    try {
      _status = PokemonDetailStateStatus.loading;

      if (id != null) {
        _pokemonModel = await _service.getPokemonById(id);
        await Future.delayed(const Duration(milliseconds: 2000));
        _img = _pokemonModel!.img;
        _number = _pokemonModel!.number;
        _name = _pokemonModel!.name;
        _height = _pokemonModel!.height;
        _weight = _pokemonModel!.weight;
        _type = _pokemonModel!.type;
        _weaknesses = _pokemonModel!.weaknesses;
        _candy = _pokemonModel!.candy;
        _spawnChance = _pokemonModel!.spawnChance;
      }
      _status = PokemonDetailStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar por Pokemon', error: e, stackTrace: s);
      _status = PokemonDetailStateStatus.errorLoadPokemon;
    }
  }
}
