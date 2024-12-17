import 'package:cars/apis/apis.dart';
import 'package:cars/models/getallmanufacturer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the model

class Carmanufacture extends StatefulWidget {
  const Carmanufacture({super.key});

  @override
  State<Carmanufacture> createState() => _CarmanufactureState();
}

class _CarmanufactureState extends State<Carmanufacture> {
  final CarmanufactureController carManufactureController =
      Get.put(CarmanufactureController()); // Initialize the controller

  late Future<List<Getallmanufacturers>> manufacturerData;

  @override
  void initState() {
    super.initState();
    manufacturerData =
        carManufactureController.fetchCarManufacturers(); // Fetch the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Car Manufacturers')),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Getallmanufacturers>>(
        future: manufacturerData, // Use the data from the controller
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Data Available'));
          } else {
            List<Getallmanufacturers> data = snapshot.data!;

            // Extract the results from the data
            List<Result> results = data.first.results;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(result.mfrName),
                      subtitle: Text('Country: ${result.country}'),
                      leading: Icon(Icons.business),
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
