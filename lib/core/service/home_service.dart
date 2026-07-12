
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';



@lazySingleton
class HomeService {

  void fetchUserInfo(){
    debugPrint("Fetching user info...");
  }

}