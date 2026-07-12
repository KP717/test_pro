

import 'package:flutter/material.dart';
import 'package:test_pro/core/service/user_profile_service.dart';
import 'package:test_pro/dependency_injection/injection_container.dart';

class UserProfileViewModel {

  late BuildContext context;
  late String title;

  void init({required BuildContext context, Map<String,dynamic>? arguments}){
    this.context = context;
    _readArguments(arguments);
  }


  void _readArguments(Map<String,dynamic>? arguments){
    if(arguments == null)return;
    title = arguments.containsKey("title") ? arguments["title"] : "User Profile";
  }

  void pop(){

    getIt<UserProfileService>().saveUserDetails();
    Navigator.pop(context);
  }

}