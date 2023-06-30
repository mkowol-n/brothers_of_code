import 'package:brothers_of_code/core/state/request_state.dart';

import 'base_state_notifier.dart';

typedef StateReducer<STATE, T> = STATE Function(T requestState);

class AsyncHandler<STATE, T> {
  final Future<T> Function() _handler;
  final BaseStateNotifier<STATE> stateNotifier;

  AsyncHandler(this._handler, this.stateNotifier);

  Future<void> execute(StateReducer<STATE, RequestState<T>> reducer) async {
    try {
      _emitNewState(const RequestState.loading(), reducer);
      final response = await _handler();
      _emitNewState(RequestState.data(response), reducer);
    } on Exception catch (exception) {
      // ignore: avoid_print
      print(exception);

      _emitNewState(RequestState.error(exception), reducer);
    }
  }

  void _emitNewState(RequestState<T> requestState, StateReducer<STATE, RequestState<T>> reducer) {
    if(!stateNotifier.mounted) {
      return;
    }
    final newState = reducer(requestState);
    // ignore: invalid_use_of_protected_member
    stateNotifier.state = newState;
  }
}
