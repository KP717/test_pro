
// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:test_pro/dependency_injection/injection_container.dart';
// import 'package:test_pro/features/login/data/datasource/auth_datasource.dart';
// import 'package:test_pro/features/login/data/datasource/login_datasource.dart';
// import 'package:test_pro/features/login/domain/entities/app_user_entity.dart';
// import 'package:test_pro/features/login/domain/repositories/login_repository.dart';


// @LazySingleton(as: LoginRepository)
// class LoginRepositoryImpl implements LoginRepository {
  
//   // @override
//   // Future<Either<Exception, AppUserEntity>> login(String email, String password) async{
//   //   return await getIt<LoginDatasource>().login(email, password);
//   // }

//   // @override
//   // Future<Either<Exception, AppUserEntity>> signup(String email, String password) async{
//   //   return await getIt<LoginDatasource>().signup(email, password);
//   // }

//   @override
//   Future<Either<Exception, AppUserEntity>> googleSingin() async{
//       final credential = await getIt<AuthDatasource>().signInWithGoogle();

//       if(credential.user == null || (credential.user?.email ?? "").isEmpty){
//         return Left(Exception("Unable to singin"));
//       }
      
//       return Right(AppUserEntity(id: credential.user?.uid ?? "", email: credential.user?.email));
//   }
  

// }