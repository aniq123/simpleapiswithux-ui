// ignore_for_file: invalid_use_of_protected_member, prefer_const_constructors

import 'package:cars/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
// Import the YesNoController

class MyAnimatedIconPage extends StatefulWidget {
  @override
  _MyAnimatedIconPageState createState() => _MyAnimatedIconPageState();
}

class _MyAnimatedIconPageState extends State<MyAnimatedIconPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final YesNoController yesNoController =
      Get.put(YesNoController()); // GetX dependency injection

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this, // vsync is used to synchronize animations
      duration: Duration(seconds: 1), // Set the duration of the animation
    );

    yesNoController
        .fetchForcedValue(); // Fetch the data when the page is initialized
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose of the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(child: Text("Yes or No")),
        actions: [
          IconButton(
            onPressed: () {
              // Toggle the animation
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow, // Using an animated icon
              progress: animationController, // Pass the animation controller
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Obx(() {
            // Access the observable data from the controller
            final maapData = yesNoController.maapData.value;

            if (maapData.isEmpty) {
              // Display a loading indicator if data is not yet available
              return CircularProgressIndicator();
            }

            // Otherwise, show the data
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.deepPurpleAccent, Colors.pinkAccent],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Answer: ${maapData['answer']}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      'Forced: ${maapData['forced'] ? "Yes" : "No"}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    maapData['image'].isNotEmpty
                        ? Image.network(
                            maapData['image'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
