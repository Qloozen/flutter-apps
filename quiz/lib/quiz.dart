import "package:flutter/material.dart";
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  String activateScreen = "landing_screen";

  void switchScreen() {
    setState(() {
      activateScreen = "questions_screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 71, 9, 82),
                Color.fromARGB(255, 133, 7, 155),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activateScreen == "landing_screen"
              ? StartScreen(switchScreen)
              : QuestionsScreen(onAnswerPressed: chooseAnswer),
        ),
      ),
    );
  }
}
