import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer

class SplashScreen extends StatefulWidget { // Changed to StatefulWidget
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after a delay
    Timer(
        const Duration(seconds: 3), // Adjust the duration as needed
        () => Navigator.pushReplacementNamed(context, '/home') 
        // Replace '/home' with your actual route name
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo', // Consider making this tag dynamic if needed
          child: Image.asset(
            'assets/images/image.png',
            // Add fit: BoxFit.contain for better image scaling
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
