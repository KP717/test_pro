

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/login/data/repositories/login_repository_impl.dart';
import 'package:test_pro/features/login/domain/entities/login_response_entity.dart';

@lazySingleton
class LoginUsecase extends UseCase<LoginResponseEntity, Map<String,dynamic>>{

  @override
  Future<Either<Exception, LoginResponseEntity>> call(Map<String, dynamic> params) {
    return getIt<LoginRepositoryImpl>().login(params["username"], params["password"]);
  }

}