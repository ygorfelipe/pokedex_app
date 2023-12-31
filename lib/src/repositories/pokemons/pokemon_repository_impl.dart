import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../model/pokemon/pokemon_model.dart';
import './pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final CustomDio _dio;

  PokemonRepositoryImpl(this._dio);

  @override
  Future<List<PokemonModel>> findAll() async {
    try {
      final response = await _dio.unauth().get(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

      final pokemonResponse = jsonDecode(response.data);

      final resultResponse = (pokemonResponse['pokemon'] as List)
          .map((p) => PokemonModel.fromMap(p))
          .toList();

      return resultResponse;
    } on DioException catch (e, s) {
      log('Erro ao buscar lista de pokemons', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar pokemons');
    }
  }

  @override
  Future<PokemonModel> getById(int id) async {
    try {
      final response = await _dio.unauth().get(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

      final pokemonResponse = jsonDecode(response.data);

      final resultResponse = (pokemonResponse['pokemon'] as List)
          .where((i) => i['id'] == id)
          .first;

      final rest = PokemonModel(
        id: resultResponse['id'],
        number: resultResponse['num'],
        name: resultResponse['name'],
        img: resultResponse['img'],
        type: resultResponse['type'],
        height: resultResponse['height'],
        weight: resultResponse['weight'],
        weaknesses: resultResponse['weaknesses'],
        nextEvolution: resultResponse['next_evolution'],
      );
      return rest;
    } on DioException catch (e, s) {
      log('Erro ao buscar lista de pokemons', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar pokemons');
    }
  }
}
