

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/splash/data/repositories/splash_repository_impl.dart';


@lazySingleton
class ValidateLoginUsecase extends UseCase<bool, NoParams>{

  @override
  Future<Either<Exception, bool>> call(NoParams params) {
    return getIt<SplashRepositoryImpl>().validateUserLogin();
  }

}