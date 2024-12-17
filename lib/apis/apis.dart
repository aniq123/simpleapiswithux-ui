// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:cars/models/getallmakes.dart';
import 'package:cars/models/getallmanufacturer.dart';
import 'package:get/get.dart'; // Make sure GetX is imported
import 'package:http/http.dart' as http;

// Ensure this import is correct
class CarController extends GetxController {
  Future<List<Getallmakes>> fetchcardata() async {
    final String url =
        "https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=json";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body); // Decode as map
      final List<dynamic> results =
          data["Results"] ?? []; // Default to an empty list if null
      return results
          .map((e) => Getallmakes.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}

class CarmanufactureController extends GetxController {
  // Future method to fetch manufacturer data from the API
  Future<List<Getallmanufacturers>> fetchCarManufacturers() async {
    final String url =
        "https://vpic.nhtsa.dot.gov/api/vehicles/getallmanufacturers?format=json";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> result = json.decode(response.body);
      return result
          .map((e) => Getallmanufacturers.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}

class YesNoController extends GetxController {
  var maapData = {}.obs;
  Future<bool> fetchForcedValue() async {
    final response = await http.get(Uri.parse('https://yesno.wtf/api'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      maapData.value = jsonData;

      return jsonData['forced']; // Extracts 'forced' as true or false
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}

class TextController extends GetxController {
  // Observable list to store quotes (Strings)
  var maodata = <String>[].obs;

  // Fetch the text data from the API
  Future<void> fetchTextValue() async {
    final response = await http
        .get(Uri.parse('https://ron-swanson-quotes.herokuapp.com/v2/quotes'));

    if (response.statusCode == 200) {
      // Decode the JSON response
      final jsonData = json.decode(response.body);

      // Ensure we are dealing with a list of strings
      if (jsonData is List) {
        maodata.value = List<String>.from(jsonData
            .map((e) => e.toString())); // Convert each element to a string
      } else {
        throw Exception(
            'Expected a list of strings, but received a different structure');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

//code for requied api
class CheckGender extends GetxController {
  // Reactive variables
  var name = ''.obs;
  var gender = ''.obs;
  var probability = 0.0.obs;
  var count = 0.obs;

  // Fetch gender from API
  Future<void> fetchGender(String inputName) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.genderize.io?name=$inputName'),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        // Update reactive variables
        name.value = jsonData['name'] ?? 'Unknown';
        gender.value = jsonData['gender'] ?? 'Unknown';
        probability.value = (jsonData['probability'] ?? 0).toDouble();
        count.value = jsonData['count'] ?? 0;
      } else {
        throw Exception("Failed to fetch gender data");
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
