import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;

  DioClient()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://fakestoreapi.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  );

  Future<Response> get(String path) {
    return dio.get(path);
  }
}