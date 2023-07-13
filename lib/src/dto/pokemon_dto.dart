// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../model/pokemon/next_evolution.dart';
import 'type_dto.dart';
import 'weaknesses_dto.dart';

class PokemonDto {
  final int id;
  //* mudar para num no serialazion
  final String number;
  final String name;
  final String img;
  final List<TypeDto> type;
  final List<WeaknessesDto> weaknesses;
  final List<NextEvolution>? nextEvolution;
  PokemonDto({
    required this.id,
    required this.number,
    required this.name,
    required this.img,
    required this.type,
    required this.weaknesses,
    this.nextEvolution,
  });
}
