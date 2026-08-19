


import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/features/login/data/models/login_response_model.dart';

abstract class LoginDatasource{
  Future<Either<Exception, LoginResponseModel>> login(String username, String password);
}

@lazySingleton
class LoginDatasourceImpl extends LoginDatasource{
  
  @override
  Future<Either<Exception, LoginResponseModel>> login(String username, String password) async{
    await Future.delayed(Duration(seconds: 5));
    return Right(LoginResponseModel(isSuccess: true));
  }


}