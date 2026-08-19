

import 'package:dartz/dartz.dart';
import 'package:test_pro/features/login/domain/entities/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<Exception, LoginResponseEntity>> login(String username, String password);
}