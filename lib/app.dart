import 'package:flutter/material.dart';
import 'screens/home/splash_screen.dart'; // We will create this file next!

class BUApp extends StatelessWidget {
  const BUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BU Gateway',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Using Bugema University's primary deep blue branding color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1), 
          primary: const Color(0xFF0D47A1),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}