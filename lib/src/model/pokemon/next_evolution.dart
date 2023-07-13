import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NextEvolution {
  final String number;
  final String name;
  NextEvolution({
    required this.number,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'num': number,
      'name': name,
    };
  }

  factory NextEvolution.fromMap(Map<String, dynamic> map) {
    return NextEvolution(
      number: map['num'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NextEvolution.fromJson(String source) =>
      NextEvolution.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NextEvolution(num: $number, name: $name)';
}
