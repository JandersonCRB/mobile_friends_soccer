import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../stores/auth_store.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AuthStore authStore = Get.find();
    if (authStore.isLogged.value!) {
      options.headers['Authorization'] = 'Bearer ${authStore.token.value}';
    }
    return super.onRequest(options, handler);
  }
}
