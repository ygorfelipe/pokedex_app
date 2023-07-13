import '../../model/pokemon/pokemon_model.dart';

abstract interface class PokemonService {
  Future<List<PokemonModel>> findAll();
  Future<PokemonModel> getById(int id);
}
