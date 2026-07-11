

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/routes/route_constant.dart';

class HomeScreenViewModel {


  late BuildContext context;

  void init({required BuildContext context}){
    this.context = context;
  }


  void goToUserProfile(){
    context.push(RouteConstant.userProfileScreen,extra: {"title": "Kumar P"});
  }

}