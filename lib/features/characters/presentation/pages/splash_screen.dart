import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isNavigated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 900), () {
      if (!_isNavigated) {
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    _isNavigated = true;
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/splash.jpg', fit: BoxFit.cover),
          ),
          Positioned(
            left: 130,
            bottom: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8879B4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onPressed: _navigateToHome,
              child: const Text(
                'Go to Home',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
