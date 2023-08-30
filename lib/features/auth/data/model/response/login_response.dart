import 'dart:convert';

class LoginResponse {
  bool result;
  String token;

  LoginResponse({
    required this.result,
    required this.token,
  });

  factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    result: json["result"],
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "result": result,
    "token": token,
  };
}