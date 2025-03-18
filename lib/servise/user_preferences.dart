import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _userEmailKey = "user_email";

  static Future<void> saveUserEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, email);
  }

  static Future<String?> getUserEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  static Future<bool> isUserLoggedIn() async {
    final email = await getUserEmail();
    return email != null && email.isNotEmpty;
  }

  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userEmailKey);
  }
}
