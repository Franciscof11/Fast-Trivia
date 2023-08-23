import 'package:fast_trivia/view/widgets/slider_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatelessWidget {
  final String titulo;
  final String urlImageBanner;
  final int idQuestionario;
  const CustomListTile(
      {super.key,
      required this.titulo,
      required this.urlImageBanner,
      required this.idQuestionario});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: heightSize > 850 ? 365 : 355,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: widthSize,
        height: heightSize,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              urlImageBanner,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 10),
              child: Text(
                titulo,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SliderButton(idQuestionario: idQuestionario),
            ),
          ],
        ),
      ),
    );
  }
}
