import 'dart:async';
import 'package:authorization/utils/exeptions/exception.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

/// функция для получения резултата
typedef ResponseJson<T> = T Function(Map<String, dynamic>);

/// функция для списка обьектов
typedef ResponseListJson<T> = T Function(List<dynamic>);

/// функция для получения пользователькой ошибка
/// [dynamic] ошибка в виде json
/// [String] ошибка по умалчанию
typedef ErrorResponsePrinter<T> = Exception Function(Map<String, dynamic>, int);

/// вызов безопасно http функцию
/// T отвер сервера
/// V ответ сервера в виде ошибки
Future<T> safeApiCallWithError<T, V>(
  Future<Response> response,
  ResponseJson<T> jsonCall,
  ErrorResponsePrinter<V> errorResponsePrinter, {
  bool? isTest,
}) async {
  await _makeThrowInternetConnection(isTest ?? false);
  try {
    final result = await response;
    final json = result.data;
    return jsonCall.call(json);
  } catch (ex) {
    if (ex is DioError) {
      final data = ex.response?.data;
      throw errorResponsePrinter.call(
        data,
        ex.response?.statusCode ?? 1,
      );
    }

    throw _throwDefaultError(ex);
  }
}

/// выкидывает исключение в виде ошибки по умалчанию
HttpRequestException<String> _throwDefaultError(exception) {
  return HttpRequestException<String>(
    message: exception,
    code: 0,
    httpTypeError: HttpTypeError.http,
  );
}

/// вызывает исключение при отсутсии интернета
Future<HttpRequestException<String>?> _makeThrowInternetConnection(
  bool isTest,
) async {
  if (isTest == false) {
    final isInternetConnection = await _checkInternetConnection();
    if (!isInternetConnection) {
      throw HttpRequestException<String>(
        message: "Нет интернет соеденения",
        code: 1,
        httpTypeError: HttpTypeError.notInternetConnection,
      );
    }
  }
  return null;
}

/// проверка интернет соеденения
Future<bool> _checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

/// обработчик ошибок по типу ошибко [Dio]
/// [DioErrorType] ошибка
String _handleDioErrorType(DioError ex, [Map<String, dynamic>? data]) {
  switch (ex.type) {
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      {
        return "Время таймаута истекло";
      }
    default:
      {
        return "Ошибка сервера";
      }
  }
}
