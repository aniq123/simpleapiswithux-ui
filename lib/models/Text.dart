// To parse this JSON data, do
//
//     final text = textFromJson(jsonString);

import 'dart:convert';

List<String> textFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String textToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
