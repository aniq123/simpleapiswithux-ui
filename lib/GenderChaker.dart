import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'apis/apis.dart'; // Import your controller

class GenderChecker extends StatefulWidget {
  const GenderChecker({Key? key}) : super(key: key);

  @override
  State<GenderChecker> createState() => _GenderCheckerState();
}

class _GenderCheckerState extends State<GenderChecker> {
  final CheckGender checkGender =
      Get.put(CheckGender()); // Initialize the controller
  final TextEditingController nameController =
      TextEditingController(); // Controller for the TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter a name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final enteredName = nameController.text.trim();
                if (enteredName.isNotEmpty) {
                  await checkGender.fetchGender(enteredName);
                } else {
                  Get.snackbar(
                    'Error',
                    'Please enter a name',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: const Text('Fetch Gender'),
            ),
            const SizedBox(height: 20),
            Obx(() => Text(
                  'Name: ${checkGender.name.value}',
                  style: const TextStyle(fontSize: 18),
                )),
            Obx(() => Text(
                  'Gender: ${checkGender.gender.value}',
                  style: const TextStyle(fontSize: 18),
                )),
            Obx(() => Text(
                  'Probability: ${checkGender.probability.value}',
                  style: const TextStyle(fontSize: 18),
                )),
            Obx(() => Text(
                  'Count: ${checkGender.count.value}',
                  style: const TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
