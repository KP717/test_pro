

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/login/domain/entities/app_user_entity.dart';
import 'package:test_pro/features/login/domain/repositories/login_repository.dart';

@lazySingleton
class LoginUsecase extends UseCase<AppUserEntity, Map<String,dynamic>>{

  @override
  Future<Either<Exception, AppUserEntity>> call(Map<String, dynamic> params) {
    return getIt<LoginRepository>().login(params["username"], params["password"]);
  }

}