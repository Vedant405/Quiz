import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;

  const ProgressCircle({
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progress =
        (currentQuestionIndex + 1) / totalQuestions; // Calculate progress

    return Stack(
      alignment: Alignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: progress),
          duration: Duration(milliseconds: 500),
          builder: (context, double value, _) {
            return SizedBox(
              width: 120,
              height: 120,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 12,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                backgroundColor: Colors.grey[300],
              ),
            );
          },
        ),
        Text(
          '${currentQuestionIndex + 1} / $totalQuestions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
