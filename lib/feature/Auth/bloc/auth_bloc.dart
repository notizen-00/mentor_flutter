import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:internship_app/core/utils/siswa_manager.dart';
import 'package:internship_app/feature/Auth/data/model/user_model.dart';
import 'package:internship_app/feature/Auth/data/repository/auth_repository.dart';
import 'package:internship_app/core/utils/token_manager.dart'; // import token manager

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final AppUserCubit appUserCubit;
  final TokenManager tokenManager;
  final SiswaManager siswaManager;

  AuthBloc({
    required this.authRepository,
    required this.appUserCubit,
    required this.tokenManager,
    required this.siswaManager,
  }) : super(AuthInitial()) {
    /// App startup - check token & user
    on<AppStarted>((event, emit) async {
      emit(AuthLoading());
      final token = await tokenManager.getToken();

      if (token != null && token.isNotEmpty) {
        try {
          final user = await authRepository.getCurrentUser();
          log('user $user');

          if (user != null) {
            appUserCubit.updateUser();
            emit(AuthAuthenticated(user));
          } else {
            emit(AuthUnauthenticated());
          }
        } catch (e) {
          emit(AuthUnauthenticated());
        }
      } else {
        emit(AuthUnauthenticated());
      }
    });

    /// Login
    on<LoggedIn>((event, emit) async {
      try {
        emit(AuthLoading());
        final loginResult = await authRepository.login(
          event.email,
          event.password,
        );

        if (loginResult != null) {
          appUserCubit.updateUser();
          emit(AuthAuthenticated(loginResult));
        } else {
          emit(AuthError('Login failed. Please check your credentials.'));
        }
      } catch (e) {
        emit(AuthError('An error occurred during login.'));
      }
    });

    on<Register>((event, emit) async {
      try {
        emit(AuthLoading());
        final registerResult = await authRepository.register(
          event.email,
          event.password,
          event.name,
        );

        if (registerResult == 'sukses') {
          appUserCubit.updateUser();
          emit(AuthRegisterSuccess());
        } else {
          emit(AuthError('Login failed. Please check your credentials.'));
        }
      } catch (e) {
        emit(AuthError('An error occurred during login.'));
      }
    });

    /// Logout (pakai TokenManager)
    on<LoggedOut>((event, emit) async {
      await tokenManager.clearToken();
      await siswaManager.clearSiswa(); // pakai token manager
      appUserCubit.updateUser();
      emit(AuthUnauthenticated());
    });
  }
}
