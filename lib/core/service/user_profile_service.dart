


import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserProfileService {

  void saveUserDetails(){
    debugPrint("saving user details...");
  }
}