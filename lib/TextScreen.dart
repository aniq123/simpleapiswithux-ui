// ignore_for_file: prefer_const_constructors

import 'package:cars/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  final TextController textController = Get.put(TextController());

  @override
  void initState() {
    super.initState();
    textController
        .fetchTextValue(); // Fetch the data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Center(child: Text('Text')),
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () {
              final maodata = textController.maodata.value; // List of quotes

              if (maodata.isEmpty) {
                return CircularProgressIndicator(); // Show a loading spinner while data is being fetched
              }

              return Padding(
                padding: EdgeInsets.all(4),
                child: Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [Colors.limeAccent, Colors.yellowAccent],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Displaying the first quote
                      Text(
                        'Quote: ${maodata[0]}', // Display the first quote from the list
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
