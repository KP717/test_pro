

import 'package:dartz/dartz.dart';

abstract class SplashRepository {
  Future<Either<Exception, bool>> validateUserLogin();
}