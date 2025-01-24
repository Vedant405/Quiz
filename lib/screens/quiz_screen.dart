import 'package:flutter/material.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quiz/utility/progress_circle.dart';
import 'package:quiz/utility/option_buttons.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedOptionId;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final response =
        await http.get(Uri.parse('https://api.jsonserve.com/Uw5CrX'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        questions = data['questions'];
      });
    } else {
      throw Exception('Failed to load questions');
    }
  }

  void onNextQuestion() {
    final isCorrect = questions[currentQuestionIndex]['options']
        .firstWhere((option) => option['id'] == selectedOptionId)['is_correct'];

    if (isCorrect) {
      score += 4; // Correct answer marks
    } else {
      score -= 1; // Negative marks
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionId =
            null; // Reset the selected option for the next question
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Quiz')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final question = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              // Add Progress Circle Here
              child: ProgressCircle(
                currentQuestionIndex: currentQuestionIndex,
                totalQuestions: questions.length,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              question['description'] ?? '',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              children: List<Widget>.generate(
                question['options'].length,
                (index) {
                  final option = question['options'][index];
                  return QuizOptionButton(
                    text: option['description'],
                    isSelected: selectedOptionId == option['id'],
                    onTap: () {
                      setState(() {
                        selectedOptionId = option['id'];
                      });
                    },
                    index: index, // Pass the index to assign fixed colors
                  );
                },
              ),
            ),
            Spacer(),
            if (selectedOptionId !=
                null) // Show the button only if an option is selected
              ElevatedButton(
                onPressed: onNextQuestion,
                child: Text(currentQuestionIndex < questions.length - 1
                    ? 'Next Question'
                    : 'Finish Quiz'),
              ),
          ],
        ),
      ),
    );
  }
}
