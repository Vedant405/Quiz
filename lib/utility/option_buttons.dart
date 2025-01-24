import 'package:flutter/material.dart';

class QuizOptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final int index;

  QuizOptionButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.blueAccent.withOpacity(0.2) // Highlight selected option
            : _getFixedPastelColor(index),
        borderRadius: BorderRadius.circular(12.0),
        border: isSelected
            ? Border.all(color: Colors.blueAccent, width: 2.0)
            : Border.all(color: Colors.transparent),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ]
            : [],
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
                  color: Colors.black87,
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
