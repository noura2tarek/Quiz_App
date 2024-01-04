import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key, required this.summaryData}) : super(key: key);
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Result Screen"),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.purple,
              Colors.deepPurpleAccent,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Result:',
                  style: GoogleFonts.lato(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 450.0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    surfaceTintColor: Colors.purple,
                    color: Colors.purple.shade300,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...summaryData.map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16.0,
                                          backgroundColor: Colors.blue.shade300,
                                          child: Text(
                                            ((e['question_index'] as int) + 1)
                                                .toString(),
                                            style: GoogleFonts.lato(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          child: Text(
                                            e['question_text'].toString(),
                                            style: GoogleFonts.lato(
                                              fontSize: 17.0,
                                              height: 1.2,
                                              fontWeight: FontWeight.w600,
                                              //Color.fromARGB(255, 255, 205, 254)
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 9.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 7.0),
                                      decoration: BoxDecoration(
                                        color: e['user_answer'] ==
                                                e['correct_answer']
                                            ? Colors.green
                                            : Colors.red[400],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Text(
                                        e['user_answer'].toString(),
                                        style: const TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 7.0),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Text(
                                        e['correct_answer'].toString(),
                                        style: const TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
