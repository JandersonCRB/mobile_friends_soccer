import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/services/auth_service.dart';
import 'package:mobile_friends_soccer/stores/auth_store.dart';

class SignUpController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String? firstName = '';
  String? lastName = '';
  String? email = '';
  String? password = '';
  final loading = false.obs;

  Future<void> signUp() async {
    if (kDebugMode) {
      print(firstName);
      print(lastName);
      print(email);
      print(password);
    }
    loading.value = true;
    try {
      final loginResponse = await AuthService.signUp(
          firstName: firstName!,
          lastName: lastName!,
          email: email!,
          password: password!);
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
      signUp();
    }
  }
}
