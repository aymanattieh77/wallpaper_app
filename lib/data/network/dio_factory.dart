import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wallpaper_app/app/constants/constants.dart';

final headers = {
  "Authorization": AppConstants.apiKey,
};

class DioFactory {
  late Dio _dio;

  static final _instance = DioFactory.internal();

  factory DioFactory() => _instance;

  Dio get dio => _dio;

  DioFactory.internal() {
    final baseOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 30 * 1000),
      receiveDataWhenStatusError: true,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: 30 * 1000),
      sendTimeout: const Duration(milliseconds: 30 * 1000),
    );

    _dio = Dio(baseOptions);

    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(requestHeader: true, responseHeader: false));
    }
  }
}
