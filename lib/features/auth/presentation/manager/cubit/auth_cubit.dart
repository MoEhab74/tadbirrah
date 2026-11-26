import 'package:bloc/bloc.dart';
import 'package:tadbirrah/features/auth/data/models/auth_user_model.dart';
import 'package:tadbirrah/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());

  final AuthRepo _authRepo;

  bool isLogin = true;

  void toggleAuthMode(bool value) {
    if (isLogin == value) return;
    isLogin = value;
    emit(ToggleAuthModeState(isLogin: isLogin));
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepo.login(
      email: email,
      password: password,
    );
    result.fold(
      (error) => emit(AuthFailure(errorMessage: error.errorMessage)),
      (user) => emit(AuthSuccess(user: user, isSignUp: false)),
    );
  }

  Future<void> signUp({
    required String familyName,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepo.signUp(
      familyName: familyName,
      email: email,
      password: password,
    );
    result.fold(
      (error) => emit(AuthFailure(errorMessage: error.errorMessage)),
      (user) => emit(AuthSuccess(user: user, isSignUp: true)),
    );
  }
}
