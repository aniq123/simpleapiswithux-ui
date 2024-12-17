// To parse this JSON data, do
//
//     final genderchaker = genderchakerFromJson(jsonString);

import 'dart:convert';

Genderchaker1 genderchaker1FromJson(String str) =>
    Genderchaker1.fromJson(json.decode(str));

String genderchaker1ToJson(Genderchaker1 data) => json.encode(data.toJson());

class Genderchaker1 {
  int count;
  String name;
  String gender;
  double probability;

  Genderchaker1({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability,
  });

  factory Genderchaker1.fromJson(Map<String, dynamic> json) => Genderchaker1(
        count: json["count"],
        name: json["name"],
        gender: json["gender"],
        probability: json["probability"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "gender": gender,
        "probability": probability,
      };
}
