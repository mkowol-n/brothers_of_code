import 'package:brothers_of_code/core/source/source_type.dart';

Future<T> sourceDecider<T>({
  required Future<T> Function() remote,
  required Future<T> Function() local,
  required SourceType type,
  required Future<void> Function(T) saveRemoteResponse,
}) async {
  switch (type) {
    case SourceType.requireRemote:
      return _requireRemote(
          saveRemoteResponse: saveRemoteResponse, remote: remote);
    case SourceType.requireLocal:
      return _requireLocal(local: local);
    case SourceType.remoteThenLocal:
      return _remoteOrLocal(
          saveRemoteResponse: saveRemoteResponse, remote: remote, local: local);
  }
}

Future<T> _requireRemote<T>(
    {required Future<void> Function(T) saveRemoteResponse,
    required Future<T> Function() remote}) async {
  final response = await remote();
  await saveRemoteResponse(response);
  return response;
}

Future<T> _requireLocal<T>({
  required Future<T> Function() local,
}) async {
  final response = await local();
  return response;
}

Future<T> _remoteOrLocal<T>({
  required Future<void> Function(T) saveRemoteResponse,
  required Future<T> Function() remote,
  required Future<T> Function() local,
}) async {
  try {
    final response = await remote();
    await saveRemoteResponse(response);
    return response;
  } catch (e) {
    final response = await local();
    if (response is List && response.isEmpty) {
      rethrow;
    }
    if (response == null) {
      rethrow;
    }
    return response;
  }
}
