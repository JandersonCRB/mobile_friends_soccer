import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PrintErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('Request error: ${err.message}');
      print('Request body: ${err.response?.data}');
    }
    handler.next(err);
  }
}
