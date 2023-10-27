import 'dart:developer';

import 'package:authorization/feature/auth/data/model/user/user_model.dart';
import 'package:authorization/feature/auth/data/pref/auth_data_source.dart';
import 'package:authorization/services/api_service.dart';
import 'package:authorization/services/locator_service.dart';
import 'package:authorization/utils/exeptions/exception.dart';
import 'package:authorization/utils/http_call_utils.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  AuthRepository()
      : _apiService = sl(),
        _authDataSource = sl();

  final ApiService _apiService;
  final AuthDataSource _authDataSource;

  Future<User> makeLogIn(String username, String password) =>
      safeApiCallWithError(
        _apiService.logIn(username, password),
        (result) {
          log(result.toString());
          saveUserAuthData(
              result['token'], result['refreshToken'], password, username);
          return User.fromJson(result['user']);
        },
        GlobalAuthException.fromJson,
      );

  void saveUserAuthData(
      String token, String refreshToken, String password, String username) {
    _authDataSource.saveToken(token);
    _authDataSource.savePassword(password);
    _authDataSource.saveUsername(username);
  }
}
