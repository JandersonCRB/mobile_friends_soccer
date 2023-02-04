import 'package:get/get.dart';

import '../models/user.dart';

class AuthStore extends GetxController {
  var token = Rxn<String?>(null);
  var user = Rxn<User?>(null);

  Rxn<bool> get isLogged => Rxn<bool>(token.value != null);

  void setLoggedIn(String token, User user) {
    this.token.value = token;
    this.user.value = user;
  }
}
