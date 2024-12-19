import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // Define routes
      routes: {
        '/food': (context) => const FoodLogScreen(),
        '/sleep': (context) => const SleepRecordScreen(),
      },
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _steps = 0; // Step count
  double _calories = 0.0; // Calories burned
  final double _stepLength = 0.78; // Average step length in meters
  final double _weight = 70; // User weight in kilograms

  late Stream<StepCount> _stepCountStream;

  @override
  void initState() {
    super.initState();
    _initializePedometer();
  }

  void _initializePedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(
      (event) {
        setState(() {
          _steps = event.steps;
          _calculateCalories();
        });
      },
      onError: (error) {
        print("Pedometer error: $error");
      },
    );
  }

  void _calculateCalories() {
    double distance = _steps * _stepLength; // Distance in meters
    double met = 3.5; // MET for walking
    setState(() {
      _calories = (distance * _weight * met) / 1000; // Calories burned
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Tracker'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purpleAccent, Colors.deepPurple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStepsTrackingCard(),
              const SizedBox(height: 30),
              _buildSection('Exercise', _buildExerciseButtons(context)),
              const SizedBox(height: 30),
              _buildSection(
                'Food Intake',
                _buildActionButton(
                  context,
                  'Log Food Intake',
                  '/food',
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(height: 30),
              _buildSection(
                'Sleep Cycle',
                _buildActionButton(
                  context,
                  'Record Sleep',
                  '/sleep',
                  backgroundColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),
              _buildSection(
                'Body Composition',
                _buildBodyCompositionButtons(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }

  Widget _buildStepsTrackingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Steps: $_steps',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Calories Burned: ${_calories.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Icon(
            Icons.directions_walk,
            size: 40,
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseButtons(BuildContext context) {
    const exercises = ['Walking', 'Running', 'Cycling', 'Yoga'];
    return Column(
      children: exercises
          .map(
            (exercise) => _buildActionButton(
              context,
              exercise,
              '/exercise',
              exercise: exercise,
              backgroundColor: Colors.purple[300]!,
            ),
          )
          .toList(),
    );
  }

  Widget _buildBodyCompositionButtons(BuildContext context) {
    const types = ['Weight', 'BMI'];
    return Column(
      children: types
          .map((type) => _buildActionButton(context, type, '/body_composition',
              type: type, backgroundColor: Colors.orange))
          .toList(),
    );
  }

  Widget _buildActionButton(BuildContext context, String title, String route,
      {String? exercise, String? type, Color backgroundColor = Colors.grey}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (exercise != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseScreen(exercise: exercise),
              ),
            );
          } else if (type != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyCompositionScreen(type: type),
              ),
            );
          } else {
            Navigator.pushNamed(context, route);
          }
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// Placeholder for Exercise Screen
class ExerciseScreen extends StatelessWidget {
  final String exercise;
  const ExerciseScreen({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$exercise Tracking'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Track your $exercise details here!',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Placeholder for Food Log Screen
class FoodLogScreen extends StatelessWidget {
  const FoodLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Log'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Log your food intake here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Placeholder for Sleep Record Screen
class SleepRecordScreen extends StatelessWidget {
  const SleepRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Record'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Record your sleep cycle here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Placeholder for Body Composition Screen (Weight or BMI)
class BodyCompositionScreen extends StatelessWidget {
  final String type;
  const BodyCompositionScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Tracker'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Track your $type details here!',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
