import 'package:flutter/material.dart';
import 'package:streaker/resources/app_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? height;

  const AppText({
    required this.text,
    this.color,
    this.size,
    this.fontFamily,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.height,
    this.textDecoration,
    this.decorationColor,
    this.decorationStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        height: height ?? 1.5,
        color: color,
        fontSize: size ?? 16,
        fontFamily: fontFamily ?? AppFonts.montserrat,
        fontWeight: fontWeight ?? FontWeight.normal,
        textBaseline: TextBaseline.alphabetic,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
      ),
    );
  }
}
