import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color textColor;
  const AppText({Key? key, required this.text, required this.size, required this.weight, this.textColor=Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.quicksand(
        fontSize: size,
        fontWeight: weight,
        color: textColor,
      ),
    );
  }
}
