import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty_explorer/core/constants/app_colors.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F1775),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.wifi_rounded, size: 250, color: AppColors.white),
            SizedBox(height: 20.h),
            Text(
              "Whoops !!",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "There is a connection error, please check your internet connection and try again",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 20.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
