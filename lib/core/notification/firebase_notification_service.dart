import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:test_pro/core/notification/notification_service.dart';
import 'package:test_pro/firebase_options_production.dart' as production;
import 'package:test_pro/firebase_options_staging.dart' as staging;

@pragma('vm:entry-point')
Future<void> _firebaseBackgroundNotificationHandler(RemoteMessage remoteMessage)async{

  String flavor = appFlavor ?? "production";

  await Firebase.initializeApp(options: flavor == "production"
      ? production.DefaultFirebaseOptions.currentPlatform
      : staging.DefaultFirebaseOptions.currentPlatform);
  NotificationService notificationService = NotificationService();
    // Initialize the plugin in the background isolate.
  await notificationService.init();

  final title = remoteMessage.data['title'] ?? 'New Notification';
  final body = remoteMessage.data['body'] ?? 'You have a new message';

  notificationService.showNotification(
    notificationId: remoteMessage.messageId?.hashCode ?? DateTime.now().millisecondsSinceEpoch.remainder(100000),
    title: "Custom: $title",
    body: body,
    payload: ""
  );
}

Future<void> _firebaseForegroundNotificationHandler(RemoteMessage remoteMessage)async{
  _printNotificationData(desc: "Firebase foreground notification:", remoteMessage: remoteMessage);
}

Future<void> _firebaseNotificationOpenedApp(RemoteMessage remoteMessage)async{
  debugPrint("Firebase notification opened app: ${remoteMessage.data}");
  _printNotificationData(desc: "Firebase notification opened app", remoteMessage: remoteMessage);
}


void _printNotificationData({required String desc, required RemoteMessage remoteMessage}){
  debugPrint("$desc: title: ${remoteMessage.notification?.title} body: ${remoteMessage.notification?.body}");
}


class FirebaseNotificationService {

  static final FirebaseMessaging firebaseMessagingInstance = FirebaseMessaging.instance;
  // static final FirebaseInAppMessaging inAppMessagingFirebaseInstance = FirebaseInAppMessaging.instance;

  static Future<void> init()async{
    // await inAppMessagingFirebaseInstance.setMessagesSuppressed(false);
  }

  Future<void> setupFirebaseMessaging()async{

    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundNotificationHandler);

    FirebaseMessaging.onMessage.listen(_firebaseForegroundNotificationHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(_firebaseNotificationOpenedApp);

    firebaseMessagingInstance.onTokenRefresh.listen((token){
      debugPrint("onTokenRefresh FCM token: $token");
    });

    firebaseMessagingInstance.subscribeToTopic("daily_reminder");
    
  }
}