

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../profile/view/user_profile.dart';

class HomeScreenViewModel {


  late BuildContext context;

  void init({required BuildContext context}){
    this.context = context;
  }


  void goToUserProfile(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));
  }

}