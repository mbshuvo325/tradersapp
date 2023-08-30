import 'package:hive/hive.dart';

class LocalDtaSource{
  static String boxName = 'appBox';
  static String tokenKey = 'token';
  static void setToken(String token) async {
    var box = await Hive.openBox(boxName);
    box.put(tokenKey, token);
  }
  static Future<String?> getToken() async {
    var box = await Hive.openBox(boxName);
    return box.get(tokenKey);
  }
}