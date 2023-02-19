import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reunited/constants.dart';
import 'package:reunited/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          textTheme: GoogleFonts.montserratTextTheme(textTheme)),
      home: const WelcomePage(),
    );
  }
}
