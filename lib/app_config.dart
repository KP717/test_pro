


import 'package:flutter/services.dart';

class AppConfig{

  static String get flavor => appFlavor ?? "staging"; 

  static const String _appUrl = String.fromEnvironment("APP_URL");

  static String get appUrl {
    if(_appUrl.isEmpty){
      throw StateError("APP URL not found");
    }
    return _appUrl;
  }

}