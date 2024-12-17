// To parse this JSON data, do
//
//     final getallmanufacturers = getallmanufacturersFromJson(jsonString);

import 'dart:convert';

Getallmanufacturers getallmanufacturersFromJson(String str) =>
    Getallmanufacturers.fromJson(json.decode(str));

String getallmanufacturersToJson(Getallmanufacturers data) =>
    json.encode(data.toJson());

class Getallmanufacturers {
  int count;
  String message;
  dynamic searchCriteria;
  List<Result> results;

  Getallmanufacturers({
    required this.count,
    required this.message,
    required this.searchCriteria,
    required this.results,
  });

  factory Getallmanufacturers.fromJson(Map<String, dynamic> json) =>
      Getallmanufacturers(
        count: json["Count"],
        message: json["Message"],
        searchCriteria: json["SearchCriteria"],
        results:
            List<Result>.from(json["Results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Count": count,
        "Message": message,
        "SearchCriteria": searchCriteria,
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String country;
  String? mfrCommonName;
  int mfrId;
  String mfrName;
  List<VehicleType> vehicleTypes;

  Result({
    required this.country,
    required this.mfrCommonName,
    required this.mfrId,
    required this.mfrName,
    required this.vehicleTypes,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        country: json["Country"],
        mfrCommonName: json["Mfr_CommonName"],
        mfrId: json["Mfr_ID"],
        mfrName: json["Mfr_Name"],
        vehicleTypes: List<VehicleType>.from(
            json["VehicleTypes"].map((x) => VehicleType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Country": country,
        "Mfr_CommonName": mfrCommonName,
        "Mfr_ID": mfrId,
        "Mfr_Name": mfrName,
        "VehicleTypes": List<dynamic>.from(vehicleTypes.map((x) => x.toJson())),
      };
}

class VehicleType {
  bool isPrimary;
  Name name;

  VehicleType({
    required this.isPrimary,
    required this.name,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
        isPrimary: json["IsPrimary"],
        name: nameValues.map[json["Name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "IsPrimary": isPrimary,
        "Name": nameValues.reverse[name],
      };
}

enum Name {
  BUS,
  INCOMPLETE_VEHICLE,
  LOW_SPEED_VEHICLE_LSV,
  MOTORCYCLE,
  MULTIPURPOSE_PASSENGER_VEHICLE_MPV,
  OFF_ROAD_VEHICLE,
  PASSENGER_CAR,
  TRAILER,
  TRUCK
}

final nameValues = EnumValues({
  "Bus": Name.BUS,
  "Incomplete Vehicle": Name.INCOMPLETE_VEHICLE,
  "Low Speed Vehicle (LSV)": Name.LOW_SPEED_VEHICLE_LSV,
  "Motorcycle": Name.MOTORCYCLE,
  "Multipurpose Passenger Vehicle (MPV)":
      Name.MULTIPURPOSE_PASSENGER_VEHICLE_MPV,
  "Off Road Vehicle": Name.OFF_ROAD_VEHICLE,
  "Passenger Car": Name.PASSENGER_CAR,
  "Trailer": Name.TRAILER,
  "Truck": Name.TRUCK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
