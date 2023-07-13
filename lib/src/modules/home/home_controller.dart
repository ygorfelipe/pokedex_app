import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../model/pokemon/pokemon_model.dart';
import '../../services/pokemons/pokemon_service.dart';
part 'home_controller.g.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  selectedPokemon,
  error;
}

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final PokemonService _pokemonService;

  HomeControllerBase(this._pokemonService);

  @readonly
  var _status = HomeStateStatus.initial;

  @readonly
  var _pokemons = <PokemonModel>[];

  @readonly
  PokemonModel? _pokemonSelected;

  @readonly
  String? _errorMessage;

  @action
  Future<void> loadPokemon() async {
    try {
      _status = HomeStateStatus.loading;
      _pokemons = await _pokemonService.findAll();
      _status = HomeStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar Pokemons', error: e, stackTrace: s);
      _status = HomeStateStatus.error;
      _errorMessage = 'Erro ao buscar Pokemons';
    }
  }

  @action
  Future<void> getPokemon(PokemonModel pokemonModel) async {
    _status = HomeStateStatus.loading;
    await Future.delayed(Duration.zero);
    _pokemonSelected = pokemonModel;
    _status = HomeStateStatus.selectedPokemon;
  }
}
