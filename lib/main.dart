import 'package:flutter/material.dart';
import 'screens/home/splash_screen.dart';
import 'screens/home/dashboard_screen.dart'; // Import your dashboard

void main() {
  runApp(const BUGatewayApp());
}

class BUGatewayApp extends StatelessWidget {
  const BUGatewayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BU Gateway',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff0a0e17),
        primaryColor: const Color(0xff0d47a1),
      ),
      // 1. Define the initial route string matching your splash screen
      initialRoute: '/',

      // 2. Map the routes so Navigator.pushNamed can find them
      routes: {
        '/': (context) => const SplashScreen(),
        '/dashboard': (context) =>
            const DashboardScreen(), // Make sure this matches the string in your splash screen transition
      },
    );
  }
}
