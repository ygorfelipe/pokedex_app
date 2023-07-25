import '../../model/pokemon/pokemon_model.dart';
import '../../repositories/pokemons/pokemon_repository.dart';
import './pokemon_service.dart';

class PokemonServiceImpl implements PokemonService {
  final PokemonRepository _pokemonRepository;

  PokemonServiceImpl(this._pokemonRepository);

  @override
  Future<List<PokemonModel>> findAll() => _pokemonRepository.findAll();

  @override
  Future<PokemonModel> getPokemonById(int id) => _pokemonRepository.getPokemonById(id);

  @override
  Future<List<PokemonModel>> findAllTeste(String? name) =>
      _pokemonRepository.findAllTeste(name);

}
