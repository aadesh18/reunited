import 'package:flutter/material.dart';
import 'package:reunited/constants.dart';
import 'package:reunited/root_app.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        backgroundColor: backgroundColor,
        splash: Column(
          children: const [
            Text(
              "ReUnited",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Our Community United Again",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black),
            ),
          ],
        ),
        nextScreen: const RootApp());
  }
}
