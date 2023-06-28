import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@Freezed()
class RequestState<T> with _$RequestState<T> {
  factory RequestState.data(T data) = Data<T>;
  const factory RequestState.loading() = Loading;
  const factory RequestState.initial() = Initial;
  factory RequestState.error(Exception exception) = Error;
}