import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TypeDto {
  final String type;
  TypeDto({
    required this.type,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
    };
  }

  factory TypeDto.fromMap(Map<String, dynamic> map) {
    return TypeDto(
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeDto.fromJson(String source) => TypeDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
