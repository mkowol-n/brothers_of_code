import 'package:flutter/material.dart';

class BaseTextView extends StatelessWidget {
  const BaseTextView(this.text,
      {super.key, this.textStyle, this.maxLines, this.overflow});

  final String text;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.left,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
