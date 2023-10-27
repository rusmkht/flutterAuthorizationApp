part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.common() = _Common;
  const factory AuthState.success() = _Success;
  const factory AuthState.error({required String errorText}) = _Error;
  const factory AuthState.loading() = _Loading;
}
