import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExerciseScreen extends StatefulWidget {
  final String exerciseType;

  const ExerciseScreen({Key? key, required this.exerciseType})
      : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final _durationController = TextEditingController();
  int _caloriesBurned = 0;

  // Method to calculate calories burned based on exercise type and duration
  void _calculateCalories() {
    final duration = int.tryParse(_durationController.text);
    if (duration != null) {
      setState(() {
        // Example of calories burned calculation (you can customize this)
        _caloriesBurned = duration * 5; // Assuming 5 calories burned per minute
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.exerciseType} Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Track your ${widget.exerciseType} details'),
            const SizedBox(height: 20),
            TextField(
              controller: _durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter duration (in minutes)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateCalories,
              child: const Text('Calculate Calories'),
            ),
            const SizedBox(height: 20),
            Text('Calories Burned: $_caloriesBurned'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can save this data to Firebase here
                // Save exercise log to Firestore
              },
              child: const Text('Save Exercise Log'),
            ),
          ],
        ),
      ),
    );
  }
}
