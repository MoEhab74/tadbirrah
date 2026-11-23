import 'package:bloc/bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool isLogin = true;
  void toggleAuthMode(bool value) {
    if (isLogin == value) return; // Guard against redundant rebuilds
    isLogin = value;
    emit(ToggleAuthModeState(isLogin: isLogin));
  }
}
