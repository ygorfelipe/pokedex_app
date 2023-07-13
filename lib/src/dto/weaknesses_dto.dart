import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeaknessesDto {
  final String weaknesses;
  WeaknessesDto({
    required this.weaknesses,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weaknesses': weaknesses,
    };
  }

  factory WeaknessesDto.fromMap(Map<String, dynamic> map) {
    return WeaknessesDto(
      weaknesses: map['weaknesses'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaknessesDto.fromJson(String source) => WeaknessesDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
