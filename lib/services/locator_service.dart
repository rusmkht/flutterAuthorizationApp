import 'package:authorization/common/constants/global_api_constant.dart';
import 'package:authorization/common/network/network.dart';
import 'package:authorization/feature/auth/data/pref/auth_data_source.dart';
import 'package:authorization/feature/auth/data/repository/auth_repository.dart';
import 'package:authorization/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.I;

void initLocator() async {
  await _commonModule();
  _networkModule();
  _dataSourceModule();
  _repositoryModule();
}

Future<void> _commonModule() async {
  /// Shared preferences
  final sharedPreferences = SharedPreferences.getInstance();
  sl.registerSingletonAsync(() => sharedPreferences);
}

Future<void> _dataSourceModule() async {
  sl.registerFactory(() => AuthDataSource(sl.getAsync()));
}

void _repositoryModule() {
  sl.registerFactory(() => AuthRepository());
}

void _networkModule() {
  sl.registerSingleton<Dio>(
    createHttpClient(GlobalApiConstant.baseApiUrl),
  );

  sl.registerSingleton(
    ApiService(sl.get()),
  );
}
