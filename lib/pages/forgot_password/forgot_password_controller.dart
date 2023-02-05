import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/services/auth_service.dart';

class ForgotPasswordController extends GetxController {
  var formKey = GlobalKey<FormState>();
  String? email = '';
  final loading = false.obs;

  Future<void> forgotPassword() async {
    loading.value = true;
    try {
      await AuthService.forgotPassword(email!);
      Get.snackbar(
        'Success',
        'Enviamos um email para você redefinir sua senha',
      );
    } on DioError catch (error) {
      print(error);
      Get.snackbar('Error', 'Email não encontrado');
    } finally {
      loading.value = false;
    }
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      forgotPassword();
    }
  }
}
