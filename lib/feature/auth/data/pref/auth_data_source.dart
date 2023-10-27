import 'package:authorization/common/constants/global_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  const AuthDataSource(this._sharedPreferences);

  final Future<SharedPreferences> _sharedPreferences;

  /// save token
  Future<void> saveToken(String token) async {
    final prefs = await _sharedPreferences;

    await prefs.setString(GlobalPrefConstant.prefAccessToken, token);
  }

  Future<String?> get token async {
    final prefs = await _sharedPreferences;
    return prefs.getString(GlobalPrefConstant.prefAccessToken);
  }

  Future<bool> removeToken() async {
    final prefs = await _sharedPreferences;

    return await prefs.remove(GlobalPrefConstant.prefAccessToken);
  }

  /// save refresh token
  Future<void> saveRefreshToken(String token) async {
    final prefs = await _sharedPreferences;

    await prefs.setString(GlobalPrefConstant.prefRefreshToken, token);
  }

  Future<String?> get refreshToken async {
    final prefs = await _sharedPreferences;
    return prefs.getString(GlobalPrefConstant.prefRefreshToken);
  }

  Future<bool> removeRefreshToken() async {
    final prefs = await _sharedPreferences;

    return await prefs.remove(GlobalPrefConstant.prefRefreshToken);
  }

  /// save refresh token
  Future<void> setLoggedIn(bool loggedIn) async {
    final prefs = await _sharedPreferences;

    await prefs.setBool(GlobalPrefConstant.isLoggedIn, loggedIn);
  }

  Future<bool?> get isloggedIn async {
    final prefs = await _sharedPreferences;
    return prefs.getBool(GlobalPrefConstant.isLoggedIn);
  }

  /// save username
  Future<void> saveUsername(String username) async {
    final prefs = await _sharedPreferences;

    await prefs.setString(GlobalPrefConstant.prefUsername, username);
  }

  Future<String?> get email async {
    final prefs = await _sharedPreferences;
    return prefs.getString(GlobalPrefConstant.prefUsername);
  }

  Future<bool> removeUsername() async {
    final prefs = await _sharedPreferences;

    return await prefs.remove(GlobalPrefConstant.prefUsername);
  }

  /// save password
  Future<void> savePassword(String password) async {
    final prefs = await _sharedPreferences;

    await prefs.setString(GlobalPrefConstant.prefPassword, password);
  }

  Future<String?> get password async {
    final prefs = await _sharedPreferences;
    return prefs.getString(GlobalPrefConstant.prefPassword);
  }

  Future<bool> removePassword() async {
    final prefs = await _sharedPreferences;

    return await prefs.remove(GlobalPrefConstant.prefPassword);
  }

  Future<bool> removeAllData() async {
    await removeToken();
    await removeUsername();
    await removePassword();
    return true;
  }
}
