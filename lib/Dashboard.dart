// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cars/GenderChaker.dart';
import 'package:cars/TextScreen.dart';
import 'package:cars/YesNoScreen.dart';
import 'package:cars/carmanufacture.dart';
import 'package:cars/carnames.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> items = ['Car  name', 'Car Manufacturer'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(child: Text('Car Information')),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(Carnames());
                // Get.to(Dashboard());
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromRGBO(0, 105, 92, 1),
                      Colors.lightGreenAccent.shade400,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.4),
                      blurRadius: 12,
                      offset: Offset(4, 6), // Creates a realistic shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 118.0),
                      child: Icon(
                        Icons.car_repair,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    //  SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        'Car Names',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: GestureDetector(
              onTap: () {
                // Get.to(Dashboard());
                Get.to(Carmanufacture());
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.indigo.shade800,
                      Colors.purple.shade400,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.4),
                      blurRadius: 12,
                      offset: Offset(4, 6), // Creates a realistic shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.car_repair,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Car Manufacturer',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: GestureDetector(
              onTap: () async {
                Get.to(MyAnimatedIconPage());
                // Get.to(Dashboard());
                // try {
                //   // Fetch the 'forced' value from the API
                //   bool forcedValue = (await YesNoController()) as bool;

                //   // Navigate with the resolved 'forced' value
                //   Get.to(YesNo(answer: '', forced: forcedValue, image: ''));
                // } catch (e) {
                //   // Handle errors (e.g., show a snackbar or alert)
                //   Get.snackbar('Error', 'Failed to fetch data');
                // }
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 161, 25, 116),
                      Color.fromARGB(255, 220, 131, 14),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.4),
                      blurRadius: 12,
                      offset: Offset(4, 6), // Creates a realistic shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.question_answer,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Padding(padding: EdgeInsets.only(right: 100)),
                    Text(
                      'Yes or No',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: GestureDetector(
              onTap: () async {
                Get.to(TextScreen());
                // Get.to(Dashboard());
                // try {
                //   // Fetch the 'forced' value from the API
                //   bool forcedValue = (await YesNoController()) as bool;

                //   // Navigate with the resolved 'forced' value
                //   Get.to(YesNo(answer: '', forced: forcedValue, image: ''));
                // } catch (e) {
                //   // Handle errors (e.g., show a snackbar or alert)
                //   Get.snackbar('Error', 'Failed to fetch data');
                // }
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 138, 224, 17),
                      Color.fromARGB(255, 61, 208, 224),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.4),
                      blurRadius: 12,
                      offset: Offset(4, 6), // Creates a realistic shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.text_fields,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15),
                    Padding(padding: EdgeInsets.only(right: 180)),
                    Text(
                      'Text',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                Get.to(GenderChecker());
              },
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 204, 28, 28),
                      Color.fromARGB(255, 86, 13, 36),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.4),
                      blurRadius: 12,
                      offset: Offset(4, 6), // Creates a realistic shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.car_repair,
                      size: 40,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 35)),
                    SizedBox(width: 15),
                    Text(
                      'Gender Cheker',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          // Container(
          //   color: Colors.amber,
          // ),
        ],
      ),
    );
  }
}
