import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty_explorer/core/constants/app_colors.dart';

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
    Future.delayed(const Duration(seconds: 5), () {
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
          SizedBox.expand(
            child: Image.asset('assets/images/splash.jpg', fit: BoxFit.cover),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 60.h,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.card,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                ),
                onPressed: _navigateToHome,
                child: Text(
                  'Go to Home',
                  style: TextStyle(fontSize: 20.sp, color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
