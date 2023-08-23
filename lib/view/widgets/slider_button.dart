import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderButton extends StatefulWidget {
  final int idQuestionario;
  const SliderButton({super.key, required this.idQuestionario});

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  @override
  Widget build(BuildContext context) {
    return SwipeButton.expand(
      thumb: const Icon(
        Icons.double_arrow_rounded,
        color: Colors.black,
      ),
      activeThumbColor: Colors.white,
      activeTrackColor: Colors.grey.shade300,
      onSwipe: () {
        print(widget.idQuestionario);
        context.push('/QuizPage', extra: widget.idQuestionario);
      },
      child: Text(
        "Deslize para jogar",
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
