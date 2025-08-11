import 'package:flutter/material.dart';

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
          children: const [
            Icon(Icons.wifi_rounded, size: 250, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "Whoops !!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "There is a connection error, please check your internet connection and try again",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
