import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight fontWeight;

  const CustomTextView(
      String this.text, {
        Key? key,
        this.textAlign = TextAlign.start,
        this.fontSize = 14.0,
        this.color = Colors.black,
        this.fontWeight = FontWeight.normal,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.figtree(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}