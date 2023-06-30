import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BaseImageView extends StatelessWidget {
  const BaseImageView({super.key, required this.src, this.placeholder});

  final String src;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      image: src,
      placeholder: kTransparentImage,
    );
  }
}
