import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a 3-second initialization delay before moving forward
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // TODO: Navigate to the Quick Links Screen once built!
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Initialization complete! Navigating to main dashboard...')),
        );

        // Navigate to the DashboardScreen after the delay
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1), // Official BU Primary Blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // The real university branding image asset
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(
                      12.0), // Adds breathing room around the logo edges
                  child: Image.asset(
                    'docs/assets/bu_logo_placeholder.png', // Placeholder for the actual BU logo
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // University Application Branding Labels
            const Text(
              'BU Gateway',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Bugema University Companion Portal',
              style: TextStyle(
                color: Colors.white.withValues(
                    alpha: 0.8), // Backwards-compatible opacity configuration
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 48),
            // Clean visual indicator showing backend processes are spinning up
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
