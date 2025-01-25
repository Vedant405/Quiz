import 'package:flutter/material.dart';

class QuizOptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isAnswerChecked; // Check if the answer is checked
  final bool isCorrect; // Check if the option is correct
  final VoidCallback onTap;
  final int index;
  final bool
      isSelectedIncorrect; // Whether this option is selected but incorrect

  QuizOptionButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.index,
    required this.isAnswerChecked,
    required this.isCorrect,
    required this.isSelectedIncorrect, // Add this to check if the option is incorrect
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.transparent;
    Color borderColor = Colors.white;

    if (isAnswerChecked) {
      // Color only the selected incorrect option in red
      if (isSelectedIncorrect) {
        backgroundColor = Colors.red.withOpacity(0.3);
        borderColor = Colors.red; // Red border for incorrect answer
      } else if (isCorrect) {
        // Correct option will be green
        backgroundColor = Color.fromARGB(255, 147, 211, 51).withOpacity(0.2);
        borderColor = Color.fromARGB(
            255, 147, 211, 51); // Green border for correct answer
      }
    } else if (isSelected) {
      backgroundColor = Colors.blue.withOpacity(0.2); // Mild blue when selected
      borderColor = Colors.blueAccent; // Blue border when selected
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: borderColor, // Use dynamic border color
          width: 2.0,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // White text for better visibility
                  fontFamily: 'BalsamiqSans', // Apply custom font
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Assign fixed pastel colors to each option based on its index
  Color _getFixedPastelColor(int index) {
    final pastelColors = [
      Color(0xFFFFD1DC), // Pastel pink
      Color(0xFFFFF1B6), // Pastel yellow
      Color(0xFFB6F7C1), // Pastel green
      Color(0xFFB6E3FF), // Pastel blue
    ];
    return pastelColors[index % pastelColors.length];
  }
}
