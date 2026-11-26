import 'package:dartz/dartz.dart';
import 'package:tadbirrah/core/errors/errors/error_model.dart';
import 'package:tadbirrah/features/auth/data/models/auth_user_model.dart';

abstract class AuthRepo {
  Future<Either<ErrorModel, AuthUserModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ErrorModel, AuthUserModel>> signUp({
    required String familyName,
    required String email,
    required String password,
  });
}
