import 'package:dio/dio.dart';

class BaseDio {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
          connectTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 60000),
          baseUrl: 'https://jsonplaceholder.typicode.com',
          contentType: 'application/json'
      ),
    );

    return dio;
  }
}