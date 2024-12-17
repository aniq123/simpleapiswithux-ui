import 'dart:convert';

// Function to parse the JSON data to Getallmakes
Getallmakes getallmakesFromJson(String str) =>
    Getallmakes.fromJson(json.decode(str));

// Function to convert Getallmakes to JSON
String getallmakesToJson(Getallmakes data) => json.encode(data.toJson());

class Getallmakes {
  int? count; // Nullable field
  String? message; // Nullable field
  dynamic searchCriteria; // Nullable field (since it can be any type)
  List<Result>? results; // Nullable list of results

  Getallmakes({
    this.count, // Nullable parameter
    this.message, // Nullable parameter
    this.searchCriteria, // Nullable parameter
    this.results, // Nullable parameter
  });

  // Factory constructor for JSON parsing
  factory Getallmakes.fromJson(Map<String, dynamic> json) => Getallmakes(
        count: json["Count"], // May be null
        message: json["Message"], // May be null
        searchCriteria: json["SearchCriteria"], // May be null
        results: json["Results"] == null
            ? null
            : List<Result>.from(
                json["Results"].map((x) => Result.fromJson(x))), // Can be null
      );

  // Function to convert Getallmakes to JSON
  Map<String, dynamic> toJson() => {
        "Count": count,
        "Message": message,
        "SearchCriteria": searchCriteria,
        "Results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  int? makeId; // Nullable field
  String? makeName; // Nullable field

  Result({
    this.makeId, // Nullable parameter
    this.makeName, // Nullable parameter
  });

  // Factory constructor for JSON parsing
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        makeId: json["Make_ID"], // May be null
        makeName: json["Make_Name"], // May be null
      );

  // Function to convert Result to JSON
  Map<String, dynamic> toJson() => {
        "Make_ID": makeId,
        "Make_Name": makeName,
      };
}
