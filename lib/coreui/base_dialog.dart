import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(32),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
