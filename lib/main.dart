import 'package:campus_roots/home.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'freelancing.dart';
import 'companies.dart';
import 'chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF800020), // Burgundy
        hintColor: const Color(0xFFB8860B), // Deep Mustard (Dark Gold)
        scaffoldBackgroundColor: Colors.grey[200], // Light Gray Background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF800020), // Burgundy
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF800020), // Burgundy
            textStyle: const TextStyle(color: Colors.white), // White Text
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey[800]), // Dark Gray Text
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF800020), width: 2.0), // Burgundy Focused Border
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF800020)), // Burgundy Border
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFFB8860B), // Deep Mustard (Dark Gold)
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
