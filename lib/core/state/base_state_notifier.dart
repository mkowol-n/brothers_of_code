import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'async_handler.dart';

abstract class BaseStateNotifier<STATE> extends StateNotifier<STATE> {
  BaseStateNotifier(super.state);

  AsyncHandler<STATE, T> asyncAction<T>(Future<T> Function() fun) => AsyncHandler(fun, this);
}