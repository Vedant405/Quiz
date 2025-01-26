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
  bool isAnswerChecked = false; // To track if the answer is checked

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

  void onCheckAnswer() {
    if (selectedOptionId != null) {
      final isCorrect = questions[currentQuestionIndex]['options'].firstWhere(
          (option) => option['id'] == selectedOptionId)['is_correct'];

      if (isCorrect) {
        score += 1; // Correct answer marks
      }

      setState(() {
        isAnswerChecked = true; // Mark the answer as checked
      });
    }
  }

  void onNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionId = null;
        isAnswerChecked = false; // Reset after moving to the next question
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
          // appBar: AppBar(
          //   title: Text('Quiz'),
          //   backgroundColor: Colors.teal.shade900,
          // ),
          // backgroundColor: Color.fromRGBO(19, 31, 36, 100),
          // body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
    }

    final question = questions[currentQuestionIndex];
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 19, 31, 36), // Dark teal background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add space above the progress circle
            SizedBox(height: 60), // Adjust this value as needed
            Center(
              child: ProgressCircle(
                currentQuestionIndex: currentQuestionIndex,
                totalQuestions: questions.length,
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'BalsamiqSans',
                color: Colors.white, // White text
              ),
            ),
            SizedBox(height: 20),
            Text(
              question['description'] ?? '',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white, // White text
                fontFamily: 'BalsamiqSans',
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: List<Widget>.generate(
                question['options'].length,
                (index) {
                  final option = question['options'][index];
                  final isCorrect = option['is_correct'];
                  final isSelectedIncorrect =
                      selectedOptionId == option['id'] && !isCorrect;

                  return QuizOptionButton(
                    text: option['description'],
                    isSelected: selectedOptionId == option['id'],
                    isAnswerChecked: isAnswerChecked,
                    isCorrect: isCorrect,
                    isSelectedIncorrect:
                        isSelectedIncorrect, // Pass if this option is incorrectly selected
                    onTap: () {
                      setState(() {
                        selectedOptionId = option['id'];
                      });
                    },
                    index: index,
                  );
                },
              ),
            ),
            Spacer(),
            if (selectedOptionId != null && !isAnswerChecked)
              ElevatedButton(
                onPressed: onCheckAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 147, 211, 51),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontFamily: 'BalsamiqSans'),
                ),
                child: Text('Check Answer'),
              ),
            if (isAnswerChecked)
              ElevatedButton(
                onPressed: onNextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 147, 211, 51),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontFamily: 'BalsamiqSans'),
                ),
                child: Text(
                  currentQuestionIndex < questions.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
