import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  String getFeedbackMessage() {
    if (score >= 9) {
      return "🏆 Amazing! You're a Quiz Master!";
    } else if (score >= 7) {
      return "🎉 Great Job! Keep it up.";
    } else if (score > 4) {
      return "👍 Good Effort! Practice makes perfect.";
    } else {
      return "😅 Don't worry! Try again and improve.";
    }
  }

  Color getProgressColor() {
    if (score >= 9) {
      return Colors.green;
    } else if (score >= 7) {
      return Colors.amber;
    } else if (score > 4) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131F24), // Dark teal background
      appBar: AppBar(
        backgroundColor: const Color(0xFF131F24),
        title: const Text('Your Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Text(
                'Quiz Completed!',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'BalsamiqSans',
                ),
              ),
              const SizedBox(height: 20),

              // Score Display
              Text(
                'Your Score: $score',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalsamiqSans',
                ),
              ),
              const SizedBox(height: 20),

              // Feedback Message
              Text(
                getFeedbackMessage(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'BalsamiqSans',
                ),
              ),
              const SizedBox(height: 30),

              // Progress Bar
              // Progress Bar
              Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: score > 0 ? (score / 10).clamp(0.0, 1.0) : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: getProgressColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Back to Home Button
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BalsamiqSans',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
