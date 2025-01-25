import 'package:flutter/material.dart';
import 'package:quiz/screens/homescreen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        scaffoldBackgroundColor:
            Color.fromRGBO(19, 31, 36, 1), // Dark teal background
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(19, 31, 36, 1),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'BalsamiqSans',
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'BalsamiqSans',
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontFamily: 'BalsamiqSans',
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontFamily: 'BalsamiqSans',
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(34, 47, 54, 1), // Button dark teal
            foregroundColor: Colors.white, // Button text color
            textStyle: TextStyle(
              fontFamily: 'BalsamiqSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        fontFamily: 'BalsamiqSans',
      ),
      home: HomeScreen(),
    );
  }
}
