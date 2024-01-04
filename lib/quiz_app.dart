import 'package:flutter/material.dart';
import 'package:quiz_app/core/managers/lists.dart';
import 'package:quiz_app/screens/modules/questions_screen.dart';
import 'package:quiz_app/screens/modules/result_screen.dart';
import 'screens/modules/home_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? activeScreen;
  List<String> userSelectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = HomeScreen(
      switchMethod: switchScreen,
    );
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: onSelectedAnswer,
      );
    });
  }

  void onSelectedAnswer(String answer) {
    userSelectedAnswers.add(answer);
    if (userSelectedAnswers.length == questionsList.length) {
      setState(() {
        activeScreen = ResultScreen(
          selectedAnswers: userSelectedAnswers,
          restart: restartM,
        );
      });
    }
  }

  void restartM() {
    setState(() {
      userSelectedAnswers = [];
      activeScreen = QuestionScreen(onSelectAnswer: onSelectedAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: activeScreen,
    );
  }
}
