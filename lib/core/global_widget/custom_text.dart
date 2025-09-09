import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final double? lineHeight;

  const CustomTextView(
      this.text, {
        Key? key,
        this.textAlign = TextAlign.start,
        this.fontSize = 14.0,
        this.color = Colors.black,
        this.fontWeight = FontWeight.normal,
        this.maxLines,
        this.overflow = TextOverflow.ellipsis,
        this.decoration,
        this.letterSpacing,
        this.lineHeight,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.figtree(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
        letterSpacing: letterSpacing,
        height: lineHeight,
      ),
    );
  }
}