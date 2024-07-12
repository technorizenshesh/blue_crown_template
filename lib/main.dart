import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:blue_crown_template/common/common_methods.dart';
import 'package:blue_crown_template/common/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'app/modules/splash/controllers/splash_controller.dart';
import 'firebase_options.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message::::::::: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CommonMethods.unFocsKeyBoard();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /* if (Platform.isAndroid) {
    print('Push Notification Android background notification start....');
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
     InitializationSettings initializationSettings =
        const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        /*     onDidReceiveBackgroundNotificationResponse: (details) {
      print('pressed notification....');
      print('the notification is selected 12 ${details.payload}');
    },*/
        onDidReceiveNotificationResponse: (payload) async {
      print('pressed notification....');
      print('the notification is selected 12 ${payload.payload}');
    });

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  } else {
    print('Push Notification Ios background notification start....');
    final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()!
        .requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }  */
  runApp(
    GetMaterialApp(
      navigatorKey: navigatorKey,
      title: "Ritz Nightclub",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: MThemeData.themeData(),
    ),
  );
}

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    // Request permission for iOS
    await _firebaseMessaging.requestPermission();

    // Wait for the APNS token to be set
    String? apnsToken;
    while (apnsToken == null) {
      apnsToken = await _firebaseMessaging.getAPNSToken();
      if (apnsToken == null) {
        await Future.delayed(Duration(seconds: 1));
      }
    }
    print("APNS Token: $apnsToken");

    // Get Firebase token
    String? token = await _firebaseMessaging.getToken();
    print("Firebase Token: $token");

    // Handle token, register it with your server if needed
  }
}
