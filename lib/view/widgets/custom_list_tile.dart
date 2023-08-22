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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              urlImageBanner,
              width: MediaQuery.of(context).size.width,
              height: 230,
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SliderButton(idQuestionario: idQuestionario),
            ),
          ],
        ),
      ),
    );
  }
}
