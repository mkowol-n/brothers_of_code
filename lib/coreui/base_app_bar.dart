import 'package:brothers_of_code/coreui/base_text_view.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BaseTextView(title),
    );
  }
}
