import 'package:cars/apis/apis.dart';
import 'package:cars/models/getallmakes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Ensure this is correctly imported

class Carnames extends StatefulWidget {
  const Carnames({super.key});

  @override
  State<Carnames> createState() => _CarnamesState();
}

class _CarnamesState extends State<Carnames> {
// Correct class name, 'Car' with uppercase C
  CarController carController = Get.put(CarController());
  late Future<List<Getallmakes>> vehicleData;

  @override
  void initState() {
    super.initState();
    vehicleData = carController.fetchcardata(); // Fetch the vehicle data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Vehicle Information')),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Getallmakes>>(
        future: vehicleData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Data Available'));
          } else {
            List<Getallmakes> data = snapshot.data!;

            // Extract the results from the data
            List<Result>? results = data.first.results;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: results?.length,
                itemBuilder: (context, index) {
                  final result = results![index];

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(result.makeId as String),
                      subtitle: Text('ID: ${result.makeId}'),
                      leading: Icon(Icons.car_repair),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
