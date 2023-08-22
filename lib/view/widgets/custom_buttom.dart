import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtom extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButtom({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
