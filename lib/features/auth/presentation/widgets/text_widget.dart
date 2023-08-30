import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextRenderer extends StatelessWidget {
  const TextRenderer({Key? key, required this.value, required this.color, required this.fontSize, required this.fontWeight}) : super(key: key);
  final String value;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(value,style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color,
        fontWeight:fontWeight));
  }
}
