

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/core/notification/firebase_notification_service.dart';
import 'package:test_pro/features/splash/presentation/bloc/splash_screen_bloc.dart';



class SplashScreenController {

  late BuildContext context;

  void init({required BuildContext context})async{
    this.context = context;
    context.read<SplashScreenBloc>().add(InitializeDefaultsEvent());

    await FirebaseNotificationService().setupFirebaseMessaging();
  }


}