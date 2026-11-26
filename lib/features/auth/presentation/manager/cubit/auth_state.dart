part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ToggleAuthModeState extends AuthState {
  final bool isLogin;

  ToggleAuthModeState({required this.isLogin});
}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthUserModel user;
  final bool isSignUp;

  AuthSuccess({required this.user, this.isSignUp = false});
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
