import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/splash_screen_ui.dart'; // อย่าลืม import หน้านี้

void main() {
  runApp(

    FlutterBodyHealthCalculatorApp(),
  );
}


class FlutterBodyHealthCalculatorApp extends StatefulWidget {
  @override
  State<FlutterBodyHealthCalculatorApp> createState() =>
      _FlutterBodyHealthCalculatorAppState();
}

class _FlutterBodyHealthCalculatorAppState
    extends State<FlutterBodyHealthCalculatorApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}


