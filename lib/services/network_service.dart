import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_pay/exceptions/error_handling.dart';
import 'package:smart_pay/interceptors/app_interceptors.dart';

class NetworkService with ErrorHandling {
  late final Dio dio;

  final String testUrl =
      "https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1";

  NetworkService() {
    dio = Dio(
      BaseOptions(
        baseUrl: testUrl,
        connectTimeout: const Duration(minutes: 1),
      ),
    );
    if (kDebugMode) {
      dio.interceptors.addAll([
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true,
        ),
        AppInterceptor(),
      ]);
    }
    dio.interceptors.add(AppInterceptor());
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleError(e);
    }
  }

  Future delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleError(e);
    }
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      handleError(e);
    }
  }
}
