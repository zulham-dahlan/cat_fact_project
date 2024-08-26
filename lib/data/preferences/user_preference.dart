import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static UserPreference? _instance;
  static SharedPreferences? _preferences;
  static const userKey = "USER_KEY";

  UserPreference._();

  factory UserPreference() {
    _instance ??= UserPreference._();
    return _instance!;
  }

  Future<SharedPreferences> get _sharedPreferences async {
    _preferences = _preferences ?? await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<void> setUser(String username) async {
    final preferences = await _sharedPreferences;
    await preferences.setString(userKey, username);
  }

  Future<String?> getUser() async {
    final preferences = await _sharedPreferences;
    return preferences.getString(userKey);
  }

  Future<void> clearDataUser() async {
    final preferences = await _sharedPreferences;
    await preferences.remove(userKey);
  }
}
