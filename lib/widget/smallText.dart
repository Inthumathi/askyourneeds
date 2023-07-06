import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final int? maxline;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final double? height;
  final TextDecoration? decoration; // New property

  SmallText({
    Key? key,
    required this.text,
    this.color,
    this.size = 16,
    this.height,
    this.fontStyle,
    this.fontWeight,
    this.maxline,
    this.overflow,
    this.textStyle,
    this.textAlign,
    this.fontFamily,
    this.decoration, // New constructor parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxline,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        fontFamily: fontFamily,
        decoration: decoration, // Set decoration
      ),
    );
  }
}
