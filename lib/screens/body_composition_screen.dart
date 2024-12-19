import 'package:flutter/material.dart';

class BodyCompositionScreen extends StatefulWidget {
  final String type;

  const BodyCompositionScreen({Key? key, required this.type}) : super(key: key);

  @override
  _BodyCompositionScreenState createState() => _BodyCompositionScreenState();
}

class _BodyCompositionScreenState extends State<BodyCompositionScreen> {
  final _weightController = TextEditingController();
  double _bmi = 0.0;

  // Method to calculate BMI
  void _calculateBMI() {
    final weight = double.tryParse(_weightController.text);
    if (weight != null && weight > 0) {
      // Assume height is 170 cm (You can change this or ask the user to input it)
      double height = 1.7; // meters
      setState(() {
        _bmi = weight / (height * height);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.type} Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (widget.type == 'Weight')
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter weight (in kg)',
                ),
              ),
            const SizedBox(height: 20),
            if (widget.type == 'Weight')
              ElevatedButton(
                onPressed: _calculateBMI,
                child: const Text('Calculate BMI'),
              ),
            if (widget.type == 'BMI') Text('BMI: $_bmi'),
          ],
        ),
      ),
    );
  }
}
