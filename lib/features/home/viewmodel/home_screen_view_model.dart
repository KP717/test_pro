

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_pro/core/service/home_service.dart';
import 'package:test_pro/routes/route_constant.dart';

import '../../../dependency_injection/injection_container.dart';

class HomeScreenViewModel {


  late BuildContext context;

  void init({required BuildContext context}){
    this.context = context;
  }


  void goToUserProfile(){

    getIt<HomeService>().fetchUserInfo();

    context.push(RouteConstant.userProfileScreen,extra: {"title": "Profile"});
  }

}