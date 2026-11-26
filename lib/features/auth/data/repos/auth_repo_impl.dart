import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tadbirrah/core/errors/errors/error_model.dart';
import 'package:tadbirrah/features/auth/data/models/auth_user_model.dart';
import 'package:tadbirrah/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseClient supabaseClient;

  AuthRepoImpl({required this.supabaseClient});

  @override
  Future<Either<ErrorModel, AuthUserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );

      final user = response.user;
      if (user == null) {
        return const Left(
          ErrorModel(errorMessage: 'تعذر تسجيل الدخول، حاول مرة أخرى.'),
        );
      }

      return Right(AuthUserModel.fromSupabaseUser(user));
    } on AuthException catch (e) {
      return Left(
        ErrorModel(
          statusCode: int.tryParse(e.statusCode ?? ''),
          errorMessage: _mapAuthErrorMessage(e.message),
        ),
      );
    } catch (e) {
      return const Left(
        ErrorModel(errorMessage: 'حدث خطأ غير متوقع، تأكد من الاتصال بالإنترنت.'),
      );
    }
  }

  @override
  Future<Either<ErrorModel, AuthUserModel>> signUp({
    required String familyName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email.trim(),
        password: password,
        data: {'family_name': familyName.trim()},
      );

      final user = response.user;
      if (user == null) {
        return const Left(
          ErrorModel(errorMessage: 'تعذر إنشاء الحساب، حاول مرة أخرى.'),
        );
      }

      return Right(AuthUserModel.fromSupabaseUser(user));
    } on AuthException catch (e) {
      return Left(
        ErrorModel(
          statusCode: int.tryParse(e.statusCode ?? ''),
          errorMessage: _mapAuthErrorMessage(e.message),
        ),
      );
    } catch (e) {
      return const Left(
        ErrorModel(errorMessage: 'حدث خطأ غير متوقع، تأكد من الاتصال بالإنترنت.'),
      );
    }
  }

  String _mapAuthErrorMessage(String message) {
    final lower = message.toLowerCase();
    if (lower.contains('invalid login credentials')) {
      return 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
    }
    if (lower.contains('email not confirmed')) {
      return 'يرجى تأكيد بريدك الإلكتروني أولاً قبل تسجيل الدخول.';
    }
    if (lower.contains('user already registered') ||
        lower.contains('already been registered')) {
      return 'هذا البريد الإلكتروني مسجل بالفعل.';
    }
    if (lower.contains('password should be at least')) {
      return 'كلمة المرور ضعيفة، يجب أن تكون 6 أحرف على الأقل.';
    }
    if (lower.contains('rate limit')) {
      return 'حاولت كثيراً، انتظر لحظة ثم حاول مرة أخرى.';
    }
    return message;
  }
}
