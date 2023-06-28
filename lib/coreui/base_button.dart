import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
