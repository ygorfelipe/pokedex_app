import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../model/pokemon/pokemon_model.dart';
import '../../../services/pokemons/pokemon_service.dart';
part 'pokemon_controller.g.dart';

enum PokemonStateStatus {
  initial,
  loading,
  loaded,
  error,
  selectedPokemon,
}

class PokemonController = PokemonControllerBase with _$PokemonController;

abstract class PokemonControllerBase with Store {
  final PokemonService _pokemonService;

  PokemonControllerBase(this._pokemonService);

  @readonly
  var _status = PokemonStateStatus.initial;

  @readonly
  var _pokemon = <PokemonModel>[];

  @readonly
  String? _filterByAz;

   @readonly
  PokemonModel? _pokemonSelected;

  //! aqui devo fazer o orderBy, pois não esta completo
  //! falta fazer a logica para utilizar de forma a-z e z-a
  @action
  void changeFilter(String? byAz) => _filterByAz = byAz;

  @action
  Future<void> loadPokemons() async {
    try {
      _status = PokemonStateStatus.loading;
      _pokemon = await _pokemonService.findAllTeste(_filterByAz);
      _status = PokemonStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar pokemon', error: e, stackTrace: s);
      _status = PokemonStateStatus.error;
    }
  }

  @action
  Future<void> getPokemon(PokemonModel pokemonModel) async {
    _status = PokemonStateStatus.loading;
    await Future.delayed(Duration.zero);
    _pokemonSelected = pokemonModel;
    _status = PokemonStateStatus.selectedPokemon;
  }
}
