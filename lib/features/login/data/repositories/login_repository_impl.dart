
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/login/data/datasource/login_datasource.dart';
import 'package:test_pro/features/login/domain/entities/login_response_entity.dart';
import 'package:test_pro/features/login/domain/repositories/login_repository.dart';


@lazySingleton
class LoginRepositoryImpl implements LoginRepository {
  
  @override
  Future<Either<Exception, LoginResponseEntity>> login(String username, String password) async{
    return await getIt<LoginDatasourceImpl>().login(username, password);
  }
  

}