

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_pro/core/service/application_service.dart';

class NotificationPermissionController {

  final BuildContext context;
  final Route bottomsheetRoute;

  const NotificationPermissionController(this.context, this.bottomsheetRoute);

  void askNotificationPermission()async{
    ApplicationService.navigatorGlobalKey!.currentState?.removeRoute(bottomsheetRoute);
    await Permission.notification.request();
  }


}