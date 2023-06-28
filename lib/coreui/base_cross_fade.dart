import 'package:cross_fade/cross_fade.dart';

class BaseCrossFade<T> extends CrossFade<T> {
  const BaseCrossFade({super.key, required super.value, required super.builder})
      : super(duration: const Duration(milliseconds: 300));
}
