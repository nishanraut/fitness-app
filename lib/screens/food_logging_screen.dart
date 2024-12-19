import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FoodLoggingScreen extends StatefulWidget {
  @override
  _FoodLoggingScreenState createState() => _FoodLoggingScreenState();
}

class _FoodLoggingScreenState extends State<FoodLoggingScreen> {
  final _foodController = TextEditingController();
  final _caloriesController = TextEditingController();

  // Function to save food log to Firebase
  void _saveFoodLog() {
    final food = _foodController.text;
    final calories = int.tryParse(_caloriesController.text);

    if (food.isNotEmpty && calories != null) {
      FirebaseFirestore.instance.collection('foodLogs').add({
        'food': food,
        'calories': calories,
        'userId': FirebaseAuth.instance.currentUser?.uid,
        'timestamp': Timestamp.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Food log saved successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Logging')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _foodController,
              decoration: const InputDecoration(
                labelText: 'Food Item',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _caloriesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Calories',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveFoodLog,
              child: const Text('Log Food'),
            ),
          ],
        ),
      ),
    );
  }
}
