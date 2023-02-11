import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_friends_soccer/services/print_error_interceptor.dart';
import 'package:mobile_friends_soccer/services/token_interceptor.dart';

var options = BaseOptions(
    baseUrl: 'http://10.0.2.2:3000/', // TODO: fetch from env
    contentType: ContentType.json.value);

final api = Dio(options)
  ..interceptors.add(TokenInterceptor())
  ..interceptors.add(PrintErrorInterceptor());
