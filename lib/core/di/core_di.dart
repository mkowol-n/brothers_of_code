import 'package:brothers_of_code/core/autorouter/app_router.dart';
import 'package:brothers_of_code/core/source/remote/api_provider.dart';
import 'package:brothers_of_code/core/network/dio.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../mapper/mapper.dart';
import '../source/local/mock_database_dao.dart';

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

final dioProvider = Provider<Dio>((ref) {
  return BaseDio.getDio();
});


final apiProvider = Provider<ApiProvider>((ref) {
  return ApiProvider(ref.read(dioProvider));
});

final mapperProvider = Provider<Mappr>((ref) {
  return Mappr();
});

final mockDAO = Provider<MockDatabaseDao>((ref) {
  return MockDatabaseDao();
});