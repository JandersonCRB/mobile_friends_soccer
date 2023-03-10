// main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_friends_soccer/pages/championships_list/championships_list_controller.dart';
import 'package:mobile_friends_soccer/pages/forgot_password/forgot_password.dart';
import 'package:mobile_friends_soccer/pages/home/home.dart';
import 'package:mobile_friends_soccer/pages/home/home_controller.dart';
import 'package:mobile_friends_soccer/pages/login/login_page.dart';
import 'package:mobile_friends_soccer/pages/welcome/welcome.dart';
import 'package:mobile_friends_soccer/stores/auth_store.dart';

import 'pages/sign_up/sign_up.dart';

void main() {
  Get.put(AuthStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Friend\'s Soccer',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: "/welcome",
          page: () => const WelcomePage(),
        ),
        GetPage(
          name: "/home",
          binding: BindingsBuilder(() {
            Get.lazyPut<HomeController>(() => HomeController());
            Get.lazyPut<ChampionshipListController>(
                () => ChampionshipListController());
          }),
          page: () => const HomePage(),
        ),
        GetPage(
          name: "/cadastro",
          page: () => SignUpPage(),
        ),
        GetPage(
          name: "/esqueceu-senha",
          page: () => ForgotPasswordPage(),
        ),
      ],
      initialRoute: '/welcome',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
        primaryColor: Colors.yellow[900],
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.yellow[800],
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.yellow[600],
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
