import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/helpers/form_validator.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (loginController) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Friend's Soccer",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: Form(
          key: loginController.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: FormValidator().email().build(),
                  onSaved: (value) => loginController.email = value ?? '',
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: FormValidator().required().build(),
                  onSaved: (value) => loginController.password = value ?? '',
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[600],
                    ),
                    onPressed: loginController.loading.value
                        ? null
                        : loginController.submitForm,
                    child: const Text('Login'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
