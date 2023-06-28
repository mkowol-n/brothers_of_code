import 'package:brothers_of_code/core/state/request_state.dart';
import 'package:dio/dio.dart';

import 'base_state_notifier.dart';

typedef StateReducer<STATE, T> = STATE Function(T requestState);

class AsyncHandler<STATE, T> {
  final Future<T> Function() _handler;
  Future<bool> Function(Exception exception)? _errorHandler;
  Future<bool> Function(DioException exception)? _apiErrorHandler;
  final BaseStateNotifier<STATE> stateNotifier;

  bool _exceptionHandled = false;

  AsyncHandler(this._handler, this.stateNotifier);

  Future<void> execute(StateReducer<STATE, RequestState<T>> reducer) async {
    try {
      _emitNewState(const RequestState.loading(), reducer);
      final response = await _handler();
      _emitNewState(RequestState.data(response), reducer);
    } on Exception catch (exception) {
      // ignore: avoid_print
      print(exception);
      _handleApiException(exception);
      _handleException(exception);
      _emitNewState(RequestState.error(exception), reducer);
    }
  }

  Future<void> _handleApiException(Exception exception) async {
    if (exception is DioException && _apiErrorHandler != null) {
      _exceptionHandled = await _apiErrorHandler!(exception);
    }
  }

  Future<void> _handleException(Exception exception) async  {
    if (_apiErrorHandler != null && !_exceptionHandled) {
      _exceptionHandled = await _errorHandler!(exception);
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

  Future<AsyncHandler> handleError(
      Future<bool> Function(Exception exception) exceptionHandler) async {
    this._errorHandler = exceptionHandler;
    return this;
  }

  Future<AsyncHandler> handleApiError(
      Future<bool> Function(DioException exception) exceptionHandler) async {
    this._apiErrorHandler = exceptionHandler;
    return this;
  }
}
