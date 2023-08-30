import 'dart:convert';

class ProfileRequest {
  int login;
  String token;

  ProfileRequest({
    required this.login,
    required this.token,
  });

  Map<String, dynamic> toMap() => {
    "login": login,
    "token": token,
  };
}
