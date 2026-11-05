

import 'package:flutter/material.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/features/login/domain/usercases/google_signin_usecase.dart';
import 'package:test_pro/features/login/domain/usercases/signup_usercase.dart';

class SignupController {

  BuildContext context;

  late TextEditingController emailController;
  late TextEditingController passwordController;


  SignupController(this.context);


  void init(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }


  void onSignUpEvent()async{
    SignupUsercase signupUseCase = SignupUsercase();

    final result = await signupUseCase.call({"email": emailController.text, "password":passwordController.text});

    result.fold(
      (error){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(error.toString())));
      }, 
      (appUserEntity){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Sign up successful.")));
      }
    );
  }

}