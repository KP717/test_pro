


import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {


  static SharedPreferences? _preferences;


  static Future<void> init()async{
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if(_preferences == null){
      throw("shared preferences not initialized");
    }

    return _preferences!;
  }

  static String getString(String key){
      return preferences.getString(key) ?? "";
  }

  static void setString({required String key, required String value}){
    preferences.setString(key, value);
  }

  static bool getBool(String key){
      return preferences.getBool(key) ?? false;
  }

  static void setBool({required String key, required bool value}){
    preferences.setBool(key, value);
  }

}