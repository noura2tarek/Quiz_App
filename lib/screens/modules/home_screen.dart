import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/core/managers/app_images.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({this.switchMethod, Key? key}) : super(key: key);

  final void Function()? switchMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.deepPurpleAccent,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.startImagePath,
                width: 300.0,
                color: Colors.white.withOpacity(0.65),
              ),
              const SizedBox(
                height: 70.0,
              ),
              Text(
                'Learn Flutter',
                style: GoogleFonts.lato(
                  color: Colors.white.withOpacity(0.65),
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white.withOpacity(0.65),
                  backgroundColor: Colors.purple.withOpacity(0.6),
                  side: BorderSide(color: Colors.white.withOpacity(0.7)),
                ),
                onPressed: switchMethod,

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const QuestionScreen(),
                //   ),
                // );

                label: const Text("Start Quiz"),
                icon: const Icon(Icons.arrow_forward_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
