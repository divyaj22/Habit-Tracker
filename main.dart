import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary color for the app
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor:
            Colors.blue[50], // Light blue background for the overall app
        appBarTheme: AppBarTheme(
          color: Colors.blue[700], // Darker blue for AppBar
          titleTextStyle:
              TextStyle(color: Colors.white), // White title color for AppBar
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900]!),
          bodyLarge: TextStyle(color: Colors.blue[800]!),
          bodyMedium: TextStyle(color: Colors.blue[600]!),
        ),
        // ElevatedButton styling
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[600], // Button background color
            foregroundColor: Colors.white, // Button text color
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      home: HomeScreen(), // Home screen where the app starts
    );
  }
}