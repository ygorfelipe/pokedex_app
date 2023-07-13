import '../../model/pokemon/pokemon_model.dart';

abstract interface class PokemonRepository {
  Future<List<PokemonModel>> findAll();
  Future<PokemonModel> getById(int id);
}
