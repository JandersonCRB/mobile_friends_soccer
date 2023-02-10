import 'package:mobile_friends_soccer/services/api.dart';

import '../dtos/login_dto.dart';
import '../dtos/sign_up_dto.dart';

class AuthService {
  static Future<LoginDto> login(String email, String password) async {
    final response = await api
        .post("api/v1/login", data: {'email': email, 'password': password});
    return LoginDto.fromJson(response.data);
  }

  static Future<SignUpDto> signUp(String email, String password) async {
    final response = await api
        .post("api/v1/login", data: {'email': email, 'password': password});
    return LoginDto.fromJson(response.data);
  }

  static Future<void> forgotPassword(String email) async {
    try {
      await api.post("/api/v1/forgot_password", data: {
        "email": email,
      });
    } catch (error) {
      rethrow;
    }
  }
}
