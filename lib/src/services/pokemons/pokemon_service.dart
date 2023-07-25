import '../../model/pokemon/pokemon_model.dart';

abstract interface class PokemonService {
  Future<List<PokemonModel>> findAll();
  Future<PokemonModel> getPokemonById(int id);

  Future<List<PokemonModel>> findAllTeste(String? name);
}
