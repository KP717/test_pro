

import 'package:flutter/material.dart';

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
    Navigator.pop(context);
  }

}