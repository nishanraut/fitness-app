import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SleepTrackingScreen extends StatefulWidget {
  @override
  _SleepTrackingScreenState createState() => _SleepTrackingScreenState();
}

class _SleepTrackingScreenState extends State<SleepTrackingScreen> {
  final _sleepDurationController = TextEditingController();

  void _saveSleepLog() {
    final sleepDuration = int.tryParse(_sleepDurationController.text);

    if (sleepDuration != null) {
      FirebaseFirestore.instance.collection('sleepLogs').add({
        'sleepDuration': sleepDuration,
        'userId': FirebaseAuth.instance.currentUser?.uid,
        'timestamp': Timestamp.now(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sleep log saved successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleep Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _sleepDurationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter sleep duration (in hours)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveSleepLog,
              child: const Text('Save Sleep Log'),
            ),
          ],
        ),
      ),
    );
  }
}
