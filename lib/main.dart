import 'package:fit_route/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/sign_in_screen.dart'; // Import your sign-in screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FitRouteApp());
}

class FitRouteApp extends StatelessWidget {
  const FitRouteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitRoute',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(), // Set the home to SignInScreen
    );
  }
}
