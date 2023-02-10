import 'package:mobile_friends_soccer/models/user.dart';

class SignUpDto {
  final User? user;
  final String? token;

  SignUpDto({this.user, this.token});

  factory SignUpDto.fromJson(Map<String, dynamic> json) {
    return SignUpDto(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'user': user,
        'token': token,
      };
}