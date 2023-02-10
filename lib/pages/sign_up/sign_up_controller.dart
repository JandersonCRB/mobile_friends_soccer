import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // loading.value = true;
    // try {
    //   final loginResponse = await AuthService.login(email!, password!);
    //   AuthStore authStore = Get.find();
    //   authStore.setLoggedIn(loginResponse.token!, loginResponse.user!);
    //
    //   Get.snackbar('Success', 'Login com sucesso');
    //   Get.offAllNamed('/home');
    // } on DioError {
    //   Get.snackbar('Error', 'Email ou senha incorretos');
    // } finally {
    //   loading.value = false;
    // }
  }

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      signUp();
    }
  }
}
