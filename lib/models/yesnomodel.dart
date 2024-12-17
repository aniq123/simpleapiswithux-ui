// To parse this JSON data, do
//
//     final yesNo = yesNoFromJson(jsonString);

import 'dart:convert';

YesNo yesNoFromJson(String str) => YesNo.fromJson(json.decode(str));

String yesNoToJson(YesNo data) => json.encode(data.toJson());

class YesNo {
  String answer;
  bool forced;
  String image;

  YesNo({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNo.fromJson(Map<String, dynamic> json) => YesNo(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  toList() {}
}
