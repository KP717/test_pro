

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/splash/data/datasource/splash_datasource.dart';
import 'package:test_pro/features/splash/domain/repositories/splash_repository.dart';


@lazySingleton
class SplashRepositoryImpl implements SplashRepository{

  @override
  Future<Either<Exception, bool>> validateUserLogin() {
      return getIt<SplashDataSourceImpl>().validateUserLogin();
  }


}