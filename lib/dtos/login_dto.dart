import 'package:mobile_friends_soccer/models/user.dart';

class LoginDto {
  String? token;
  User? user;

  LoginDto({this.token, this.user});

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'token': token,
        'user': user,
      };
}