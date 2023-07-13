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

  @action
  Future<void> loadPokemon(int? id) async {
    try {
      _status = PokemonDetailStateStatus.loaded;
      _pokemonModel = await _service.getById(id!);
      _status = PokemonDetailStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar por Pokemon', error: e, stackTrace: s);
      _status = PokemonDetailStateStatus.errorLoadPokemon;
    }
  }
}
