import 'package:authorization/feature/auth/data/model/user/user_model.dart';
import 'package:authorization/feature/auth/data/repository/auth_repository.dart';
import 'package:authorization/services/locator_service.dart';
import 'package:authorization/utils/mixins/request_worker_mixin.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> with CoreRequestWorkedMixin {
  AuthCubit()
      : _authRepository = sl(),
        super(AuthState.common());

  final AuthRepository _authRepository;

  makeRequest(String username, String password) async {
    await launchWithAuthError<User, Exception>(
        request: _authRepository.makeLogIn(
          username,
          password,
        ),
        resultData: (result) => emit(AuthState.success()),
        loading: (isLoading) => emit(AuthState.loading()),
        errorData: (errorData) {
          emit(
            AuthState.error(errorText: errorData.toString()),
          );
        });
  }
}
