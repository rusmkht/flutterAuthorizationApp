import 'dart:developer';

import 'package:authorization/feature/auth/data/model/user/user_model.dart';
import 'package:authorization/feature/auth/data/pref/auth_data_source.dart';
import 'package:authorization/feature/auth/data/repository/auth_repository.dart';
import 'package:authorization/services/locator_service.dart';
import 'package:authorization/utils/exeptions/exception.dart';
import 'package:authorization/utils/mixins/request_worker_mixin.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/material/snack_bar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> with CoreRequestWorkedMixin {
  AuthCubit()
      : _authRepository = sl(),
        _authDataSource = sl(),
        super(AuthState.common());

  final AuthRepository _authRepository;
  final AuthDataSource _authDataSource;

  makeLogIn(String username, String password) async {
    await launchWithAuthError<User, GlobalAuthException>(
        request: _authRepository.makeLogIn(
          username,
          password,
        ),
        resultData: (result) {
          _authDataSource.setLoggedIn(true);
          emit(AuthState.success(user: result));
        },
        loading: (isLoading) => emit(AuthState.loading()),
        errorData: (errorData) {
          print('error state');
          print(errorData.message);
          emit(
            AuthState.error(errorText: errorData.message ?? ''),
          );
        });
    emit(AuthState.common());
  }

  Future<bool> logOut() async {
    await _authDataSource.setLoggedIn(false);
    return await _authDataSource.removeAllData();
  }
}
