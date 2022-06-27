import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizedText extends StatelessWidget {
  const SizedText(
    this.text, {
    Key? key,
    required this.maxWidth,
    this.style = const TextStyle(),
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.locale,
    this.softWrap = false,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  final String text;
  final double maxWidth;
  final TextStyle style;
  final int maxLines;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool softWrap;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    double width = textSize(
      text: text,
      textStyle: style,
      maxLines: maxLines,
      locale: locale,
    ).width;

    return SizedBox(
      width: width > maxWidth ? maxWidth : width,
      child: RichText(
        text: TextSpan(
          text: text,
          style: style,
        ),
        maxLines: maxLines,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
      ),
    );
  }

  static Size textSize({
    required String text,
    required TextStyle textStyle,
    Locale? locale,
    int maxLines = 1,
  }) {
    return (TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      maxLines: maxLines,
      textScaleFactor: Get.textScaleFactor,
      textDirection: TextDirection.ltr,
      locale: locale,
    )..layout())
        .size;
  }
}
