


import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_pro/features/login/data/models/app_user.dart';

abstract class LoginDatasource{
  Future<Either<Exception, AppUserModel>> login(String email, String password);
  Future<Either<Exception, AppUserModel>> signup(String email, String password);
}

@LazySingleton(as: LoginDatasource)
class LoginDatasourceImpl extends LoginDatasource{
  
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Exception, AppUserModel>> login(String email, String password) async{
    try{
        final UserCredential credentials = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

        debugPrint("SignIn is user null: ${credentials.user == null}");
        
        if(credentials.user == null){
          return Left(Exception("Unable to signin."));
        }

        return Right(AppUserModel(id: credentials.user?.uid as String, email: credentials.user?.email));
    }catch(e){
      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception, AppUserModel>> signup(String email, String password) async{
    try{
        final UserCredential credentials = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

        if(credentials.user == null){
          return Left(Exception("Unable to signup."));
        }

        return Right(AppUserModel(id: credentials.user?.uid as String, email: credentials.user?.email));
    }catch(e){
      return Left(Exception(e.toString()));
    }
    
  }


}