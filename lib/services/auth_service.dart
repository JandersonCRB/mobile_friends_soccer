import 'package:mobile_friends_soccer/services/api.dart';

import '../dtos/login_dto.dart';

class AuthService {
  static Future<LoginDto> login(String email, String password) async {
    final response = await api
        .post("api/v1/login", data: {'email': email, 'password': password});
    return LoginDto.fromJson(response.data);
  }
}
