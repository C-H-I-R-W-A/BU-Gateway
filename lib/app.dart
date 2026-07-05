import 'package:flutter/material.dart';
import 'constants/theme.dart';
import 'screens/home/home_screen.dart';

class BuGatewayApp extends StatefulWidget {
  const BuGatewayApp({super.key});

  @override
  State<BuGatewayApp> createState() => _BuGatewayAppState();
}

class _BuGatewayAppState extends State<BuGatewayApp> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BU Gateway',
      debugShowCheckedModeBanner: false,
      theme: BUTheme.lightTheme,
      darkTheme: BUTheme.darkTheme,
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        onToggleTheme: _toggleTheme,
        isDark: _isDarkTheme,
      ),
    );
  }
}
