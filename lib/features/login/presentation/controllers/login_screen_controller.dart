

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/constants/preference_constant.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/core/storage/preference_manager.dart';
import 'package:test_pro/core/usecases/usercases.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
import 'package:test_pro/features/login/domain/usercases/google_signin_usecase.dart';
import 'package:test_pro/features/login/domain/usercases/login_usecase.dart';

class LoginScreenController {
  
  late BuildContext context; 

  late TextEditingController usernameController;
  late TextEditingController passwordController;

  void init(BuildContext context){
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    this.context = context;
  }


  void dispose(){
    try{
      usernameController.dispose();
      passwordController.dispose();
    }catch(_){}
  }

  void onLoginEvent()async{
    
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if(username.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Username is required")));
      return;
    }

    if(password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password is required")));
      return;
    }

    _progressDialog();

    var result = await getIt<LoginUsecase>().call({"username": username, "password" : password});
    print("login res: $result");

    Navigator.pop(context);

    result.fold((exception){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(exception.toString())));
    }, (userEntity){

      if((userEntity.email ?? "").isNotEmpty){
        PreferenceManager.setString(key: PreferenceConstant.isLoggedIn, value: "Yes");
        context.go(RouteConstant.postsScreen);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed, please try again!")));
      }
    });
  
  }

  void onGoogleSignIn()async{

    try{

      final result = await GoogleSigninUsecase().call(NoParams());
      
      debugPrint("onGoogleSignIn result: $result");

      result.fold(
        (error){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(error.toString())));
        },
        (appUserEntity){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Sign up successful.")));
          PreferenceManager.setString(key: PreferenceConstant.isLoggedIn, value: "Yes");
          context.go(RouteConstant.postsScreen);
        }
      );
    } on FirebaseAuthException catch (authException){
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authException.message ?? 'Google sign-in failed'),
        ),
      );
    }catch(e){
      if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to sign in with Google.'),
          ),
      );
    }

  }

  Future<void> _progressDialog({String? message})async{

    await showDialog(context: context, 
      barrierColor: Colors.white.withAlpha(900),
      barrierDismissible: false,
      builder: (context){
        return PopScope(canPop: false,child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                const SizedBox(height: 12,),
                Text(message ?? "Authenticating...", style: TextStyle(color:Colors.black, fontSize: 16)),
              ],
            ),
          ),
        ));
    });
  }
}