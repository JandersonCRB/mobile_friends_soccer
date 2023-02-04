import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_friends_soccer/components/gf_outlined_button.dart';
import 'package:mobile_friends_soccer/components/light_underlined_input_decoration.dart';
import 'package:mobile_friends_soccer/helpers/form_validator.dart';
import '../../components/backbutton_overlay.dart';
import '../welcome/welcome_background.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());

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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
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
                    key: _loginController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const LightUnderlinedInputDecoration(
                            labelText: "Email",
                          ),
                          validator: FormValidator().email().build(),
                          onSaved: (value) {
                            _loginController.email = value;
                          },
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          decoration: const LightUnderlinedInputDecoration(
                            labelText: "Senha",
                          ),
                          obscureText: true,
                          validator: FormValidator().required().build(),
                          onSaved: (value) {
                            _loginController.password = value;
                          },
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed("/esqueceu-senha");
                            },
                            child: Text(
                              "Esqueceu a senha?",
                              style: GoogleFonts.inter(
                                color: const Color(0xFFD8DDDE),
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: GFOutlinedButton(
                            text: "Entrar",
                            onPressed: _loginController.submitForm,
                            filled: true,
                          ),
                        ),
                        const SizedBox(height: 48),
                        TextButton(
                          onPressed: () {
                            Get.offNamed("/cadastro");
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Ainda não possui uma conta? ",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color(0xFF97ABB1),
                              ),
                              children: [
                                TextSpan(
                                  text: "Cadastre-se",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: const Color(0xFFDD8330),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const BackButtonOverlay(),
        ],
      ),
    );
  }
}
