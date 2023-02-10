import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_friends_soccer/components/auth_background.dart';
import 'package:mobile_friends_soccer/components/gf_outlined_button.dart';
import 'package:mobile_friends_soccer/components/light_underlined_input_decoration.dart';
import 'package:mobile_friends_soccer/helpers/form_validator.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AuthBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
            child: Form(
              key: forgotPasswordController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Esqueceu a senha?",
                    style: GoogleFonts.inter(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: const LightUnderlinedInputDecoration(
                      labelText: "Email",
                    ),
                    validator: FormValidator().email().build(),
                    onSaved: (email) {
                      forgotPasswordController.email = email;
                    },
                  ),
                  const SizedBox(height: 48),
                  GFOutlinedButton(
                    text: "Redefinir senha",
                    onPressed: forgotPasswordController.submitForm,
                    filled: true,
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
