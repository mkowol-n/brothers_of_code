import 'package:brothers_of_code/core/autorouter/app_router.dart';
import 'package:brothers_of_code/core/network/api_provider.dart';
import 'package:brothers_of_code/core/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

final dioProvider = Provider<Dio>((ref) {
  return BaseDio.getDio();
});


final apiProvider = Provider<ApiProvider>((ref) {
  return ApiProvider(ref.read(dioProvider));
});
