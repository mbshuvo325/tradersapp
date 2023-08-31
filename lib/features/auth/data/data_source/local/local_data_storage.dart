import 'package:hive/hive.dart';
import 'package:interviewapp/features/auth/data/model/response/profile_response.dart';

class LocalDtaSource{
  static String boxName = 'appBox';
  static String tokenKey = 'token';
  static String loginKey = "login";
  static String profileKey = "profile";

  static void setToken(String token) async {
    var box = await Hive.openBox(boxName);
    box.put(tokenKey, token);
  }

  static Future<String?> getToken() async {
    var box = await Hive.openBox(boxName);
    return box.get(tokenKey);
  }

  static void setLoginKey(String key) async{
    var box = await Hive.openBox(boxName);
    box.put(loginKey, key);
  }

  static Future<String?> getLoginKey() async {
    var box = await Hive.openBox(boxName);
    return box.get(loginKey);
  }

  static void setProfile(ProfileResponse response) async{
    var box = await Hive.openBox(boxName);
    box.put(profileKey, response.toMap());
  }

  static Future<ProfileResponse>? getUserProfile() async{
    var box = await Hive.openBox(boxName);
    final response = await box.get(profileKey);
    final result = ProfileResponse.fromMap(response);
    return result;
  }

  static void clearBox() async{
    var box = await Hive.openBox(boxName);
    box.clear();
  }
}