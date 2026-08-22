

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/constants/preference_constant.dart';
import 'package:test_pro/core/routes/route_constant.dart';
import 'package:test_pro/core/storage/preference_manager.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';
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

    print("Username: $username");
    print("Password: $password");

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
    result.fold((exception){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something went wrong!")));
    }, (response){
      Navigator.pop(context);
      if(response.isSuccess){
        PreferenceManager.setString(key: PreferenceConstant.isLoggedIn, value: "Yes");
        context.go(RouteConstant.postsScreen);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login failed, please try again!")));
      }
    });
  
  }

  Future<void> _progressDialog()async{

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
                Text("Authenticating...", style: TextStyle(color:Colors.black, fontSize: 16)),
              ],
            ),
          ),
        ));
    });
  }
}