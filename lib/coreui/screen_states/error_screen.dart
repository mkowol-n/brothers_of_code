import 'package:flutter/material.dart';

import '../base_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Coś poszło nie tak'), // TODO easy localization
          const SizedBox(
            height: 32,
          ),
          BaseButton(
            onPressed: onRetry,
            text: 'Spróbuj ponownie', // TODO easy localization
          )
        ],
      ),
    );
  }
}
