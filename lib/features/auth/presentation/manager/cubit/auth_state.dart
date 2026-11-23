part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ToggleAuthModeState extends AuthState {
  final bool isLogin;

  ToggleAuthModeState({required this.isLogin});
}
