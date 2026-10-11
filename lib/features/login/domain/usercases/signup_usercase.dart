

import 'package:dartz/dartz.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/login/domain/entities/app_user_entity.dart';
import 'package:test_pro/features/login/domain/repositories/login_repository.dart';

class SignupUsercase extends UseCase<AppUserEntity, Map<String,dynamic>>{
  
  @override
  Future<Either<Exception, AppUserEntity>> call(Map<String, dynamic> params) async{
    return await getIt<LoginRepository>().signup(params["email"], params["password"]);
  }

}