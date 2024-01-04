import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/managers/lists.dart';

import '../widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, this.onSelectAnswer}) : super(key: key);
  final void Function(String answer)? onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndexIndex = 0;

  // Answer question method
  void answerQuestion(String answer) {
    widget.onSelectAnswer!(answer);
    setState(() {
      currentQuestionIndexIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questionsList[currentQuestionIndexIndex];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.purple,
              Colors.deepPurpleAccent,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Question ${currentQuestionIndexIndex + 1} of ${questionsList.length}:",
                style: GoogleFonts.lato(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: const EdgeInsets.all(30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                surfaceTintColor: Colors.purple,
                color: Colors.purple.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentQuestion.questionText,
                        style: GoogleFonts.lato(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // [[1,2,3],4]  = [1,2,3,4]
                      ...currentQuestion.shuffledAnswers.map((e) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 0.6),
                          child: AnswerButton(
                            answerText: e,
                            onPressed: () => answerQuestion(e),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
