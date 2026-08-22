

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/core/constants/preference_constant.dart';
import 'package:test_pro/core/storage/preference_manager.dart';

abstract class SplashDataSource{
  Future<Either<Exception, bool>> validateUserLogin();
}

@lazySingleton
class SplashDataSourceImpl implements SplashDataSource{

  @override
  Future<Either<Exception, bool>> validateUserLogin() async{
    try{
      String isLoggedIn = PreferenceManager.getString(PreferenceConstant.isLoggedIn);
      print("isLoggedIn str: $isLoggedIn");
      return Right(isLoggedIn == "Yes");
    }catch(e){
      print("SplashDataSourceImpl exception: $e");
      return Left(Exception(e.toString()));
    }
  }

}
