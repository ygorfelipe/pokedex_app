import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListOfPokemonModel {
  final int id;
  final String number;
  final String name;
  final String img;
  ListOfPokemonModel({
    required this.id,
    required this.number,
    required this.name,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'num': number,
      'name': name,
      'img': img,
    };
  }

  factory ListOfPokemonModel.fromMap(Map<String, dynamic> map) {
    return ListOfPokemonModel(
      id: map['id'] as int,
      number: map['num'] as String,
      name: map['name'] as String,
      img: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListOfPokemonModel.fromJson(String source) =>
      ListOfPokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ListOfPokemonModel(id: $id, num: $number, name: $name, img: $img)';
  }
}
