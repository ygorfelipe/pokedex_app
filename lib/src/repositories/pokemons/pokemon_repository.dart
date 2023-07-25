import '../../model/pokemon/pokemon_model.dart';

abstract interface class PokemonRepository {
  Future<List<PokemonModel>> findAllTeste(String? name);
  Future<List<PokemonModel>> findAll();
  Future<PokemonModel> getPokemonById(int id);
}
