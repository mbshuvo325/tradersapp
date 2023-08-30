
class LoginRequest {
  int login;
  String password;

  LoginRequest({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
    "login": login,
    "password": password,
  };
}
