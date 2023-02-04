import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/services/auth_service.dart';

import '../../stores/auth_store.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String? email = '';
  String? password = '';
  final loading = false.obs;

  Future<void> login() async {
    loading.value = true;
    try {
      final loginResponse = await AuthService.login(email!, password!);
      AuthStore authStore = Get.find();
      authStore.setLoggedIn(loginResponse.token!, loginResponse.user!);

      Get.snackbar('Success', 'Login com sucesso');
      Get.offAllNamed('/home');
    } on DioError {
      Get.snackbar('Error', 'Email ou senha incorretos');
    } finally {
      loading.value = false;
    }
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      login();
    }
  }
}
