import 'package:flutter/material.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List questions = [];
  int currentQuestionIndex = 0;
  int score = 0;

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

  void checkAnswer(bool isCorrect) {
    if (isCorrect) {
      score += 4; // Correct answer marks
    } else {
      score -= 1; // Negative marks
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
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
                (index) => RadioListTile(
                  title: Text(question['options'][index]['description']),
                  value: question['options'][index]['is_correct'],
                  groupValue: null,
                  onChanged: (value) => checkAnswer(value as bool),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
