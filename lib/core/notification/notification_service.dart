
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {


  static FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  static final String ANDORID_NOTIFICAITON_CHANNEL_ID = "TEST_PRO_MAIN_NOTIFICAITON_CHANNEL_ID";
  static final String ANDORID_NOTIFICAITON_CHANNEL = "TEST_PRO_MAIN_NOTIFICATION_CHANNEL";
  static final String ANDORID_NOTIFICAITON_CHANNEL_DESCRIPTION = "Test pro default channel description";


  Future<void> init()async{

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    
    final InitializationSettings initializationSettings = InitializationSettings(
      android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: const DarwinInitializationSettings(
        requestAlertPermission: true, 
        requestBadgePermission: true, 
        requestSoundPermission: true
      )
    );

    await _flutterLocalNotificationsPlugin?.initialize(
      settings:initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationRepsonseRecieved
    );

    if(Platform.isAndroid){
      AndroidNotificationChannel? _androidNotificationChannel = AndroidNotificationChannel(
        ANDORID_NOTIFICAITON_CHANNEL, 
        ANDORID_NOTIFICAITON_CHANNEL_ID, 
        description: ANDORID_NOTIFICAITON_CHANNEL_DESCRIPTION,
        importance: Importance.high
      );

      await _flutterLocalNotificationsPlugin?.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(_androidNotificationChannel!);
    }

  }

  void _onNotificationRepsonseRecieved(NotificationResponse response){
      print("---- Notifican tapped ---- ${response.payload}");
  }


  void showNotification({
    required int notificationId,
    required String title,
    required String body,
    required String payload,
  }){

    final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      ANDORID_NOTIFICAITON_CHANNEL_ID, 
      ANDORID_NOTIFICAITON_CHANNEL,
      channelDescription: ANDORID_NOTIFICAITON_CHANNEL_DESCRIPTION,
      importance: Importance.high,
      priority: Priority.high
      
    );

    final DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(presentAlert: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails);

    _flutterLocalNotificationsPlugin?.show(
      id: notificationId, 
      title: title,
      body: body,
      payload: payload,
      notificationDetails: notificationDetails,
    );
  }

}