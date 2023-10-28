import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._httpClient);

  final Dio _httpClient;

  Future<Response> logIn(
    String username,
    String password,
  ) async {
    return _httpClient.post(
      'api/v1/auth/login',
      data: {
        "email": username,
        "password": password,
      },
    );
  }
}
