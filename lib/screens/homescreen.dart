import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 19, 31, 36),
              Color.fromARGB(255, 19, 31, 36)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header Title
            Text(
              "🎯 Quiz Master",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'BalsamiqSans',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            // Subtitle
            Text(
              "Are you ready to test your knowledge?",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.tealAccent,
                fontFamily: 'BalsamiqSans',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Thematic Illustration (optional: can replace with an image asset)
            Icon(
              Icons.quiz,
              size: 100,
              color: Colors.tealAccent,
            ),
            const SizedBox(height: 40),

            // Start Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 15.0,
                ),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalsamiqSans',
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
              ),
              child: const Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
