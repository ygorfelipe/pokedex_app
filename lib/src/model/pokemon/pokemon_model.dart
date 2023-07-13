import 'dart:convert';
import 'next_evolution.dart';

class PokemonModel {
  final int id;
  //* mudar para num no serialazion
  final String number;
  final String name;
  final String img;
  final List<dynamic> type;
  final String height;
  final String weight;
  final List<dynamic> weaknesses;
  final List<dynamic>? nextEvolution;
  PokemonModel({
    required this.id,
    required this.number,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.weaknesses,
    required this.nextEvolution,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'num': number,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'weaknesses': weaknesses,
      'next_evolution': nextEvolution?.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      number: map['num'] as String,
      name: map['name'] as String,
      img: map['img'] as String,
      type: (map['type'] as List<dynamic>).map((x) => x as String).toList(),
      height: map['height'] as String,
      weight: map['weight'] as String,
      weaknesses:
          (map['weaknesses'] as List<dynamic>).map((x) => x as String).toList(),
      nextEvolution: map['next_evolution'] != null
          ? List<NextEvolution>.from(
              (map['next_evolution']).map<NextEvolution?>(
                (x) => NextEvolution.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonModel(id: $id, num: $number, name: $name, img: $img, type: $type, height: $height, weight: $weight, weaknesses: $weaknesses, next_evolution: $nextEvolution)';
  }
}
