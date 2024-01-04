import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/managers/lists.dart';
import 'package:quiz_app/screens/modules/questions_screen.dart';

import '../widgets/build_summary_item.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.restart,
    required List<String> selectedAnswers,
  })  : _uSelectedAnswers = selectedAnswers,
        super(key: key);
  final List<String> _uSelectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> get _summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < _uSelectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question_text': questionsList[i].questionText,
        'correct_answer': questionsList[i].answers[0],
        'user_answer': _uSelectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorrectAnswers = _summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;
    // summaryData.forEach((element) {
    //   if (element['user_answer'] == element['correct_answer']) {
    //     numOfCorrectAnswers++;
    //   }
    // });

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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Congrats! you finished the Quiz.",
                style: GoogleFonts.lato(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade200,
                  height: 1.4,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                'You have answered $numOfCorrectAnswers out of ${questionsList.length} questions correctly.',
                style: GoogleFonts.lato(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Summary(
                                summaryData: _summaryData,
                              )));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent.shade100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11.0,
                    vertical: 9.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  textStyle: GoogleFonts.lato(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                child: const Text('View Result'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton.icon(
                onPressed: restart,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent.shade100,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 9.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  textStyle: GoogleFonts.lato(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                icon: const Icon(Icons.restart_alt_outlined),
                label: const Text(
                  'Restart Quiz',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
