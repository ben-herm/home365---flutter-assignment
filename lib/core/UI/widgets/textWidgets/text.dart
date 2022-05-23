import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  final String? text;
  final int? maxLines;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Text(
        text ?? '',
        textScaleFactor: 1,
        textAlign: textAlign,
        style: GoogleFonts.lexend(textStyle: style),
        maxLines: maxLines,
      ),
    );
  }
}
