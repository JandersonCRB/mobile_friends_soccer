import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_friends_soccer/components/backbutton_overlay.dart';
import 'package:mobile_friends_soccer/components/gf_outlined_button.dart';
import 'package:mobile_friends_soccer/components/light_underlined_input_decoration.dart';
import 'package:mobile_friends_soccer/helpers/form_validator.dart';
import 'package:mobile_friends_soccer/pages/sign_up/sign_up_controller.dart';
import 'package:mobile_friends_soccer/pages/welcome/welcome_background.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WelcomeBackground(),
          SafeArea(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Criar conta",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 32,
                            color: const Color(0xFFDD8330),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                      Form(
                        key: _signUpController.formKey,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration:
                                        const LightUnderlinedInputDecoration(
                                      labelText: "Nome",
                                    ),
                                    validator:
                                        FormValidator().minLength(3).build(),
                                    onSaved: (value) {
                                      _signUpController.firstName = value;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                  child: TextFormField(
                                      decoration:
                                          const LightUnderlinedInputDecoration(
                                        labelText: "Sobrenome",
                                      ),
                                      validator:
                                          FormValidator().minLength(3).build(),
                                      onSaved: (value) {
                                        _signUpController.lastName = value;
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            TextFormField(
                              decoration: const LightUnderlinedInputDecoration(
                                labelText: "Email",
                              ),
                              validator: FormValidator().email().build(),
                              onSaved: (value) {
                                _signUpController.email = value;
                              },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            TextFormField(
                              decoration: const LightUnderlinedInputDecoration(
                                labelText: "Senha",
                                helperText: "Mínimo de 6 caracteres",
                              ),
                              obscureText: true,
                              validator: FormValidator().password().build(),
                              onSaved: (value) {
                                _signUpController.password = value;
                              },
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: GFOutlinedButton(
                                text: "Continuar",
                                disabled: _signUpController.loading.value,
                                onPressed: _signUpController.submitForm,
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offNamed("/login");
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Já possui uma conta? ",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xFF97ABB1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Entre",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: const Color(0xFFDD8330),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const BackButtonOverlay(),
        ],
      ),
    );
  }
}
