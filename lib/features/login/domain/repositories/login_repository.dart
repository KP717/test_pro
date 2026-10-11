

import 'package:dartz/dartz.dart';
import 'package:test_pro/features/login/domain/entities/app_user_entity.dart';

abstract class LoginRepository {
  Future<Either<Exception, AppUserEntity>> login(String email, String password);
  Future<Either<Exception, AppUserEntity>> signup(String email, String password);
  Future<Either<Exception, AppUserEntity>> googleSingin();

}