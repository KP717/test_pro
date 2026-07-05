

import 'package:flutter/material.dart';

class UserProfileViewModel {

  late BuildContext context;

  void init({required BuildContext context}){
    this.context = context;
  }


  void pop(){
    Navigator.pop(context);
  }

}