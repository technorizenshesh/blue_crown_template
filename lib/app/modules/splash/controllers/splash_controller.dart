import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blue_crown_template/common/text_styles.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/PushNotificationService.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late SharedPreferences sharedPreferences;
  final count = 0.obs;

  Future<void> setupInteractedMessage() async {
    print('Push Notification for ios in foreground.......');
    // Get device token...
    PushNotificationService.getToken();
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    print('Notification title:-${notification!.title}');
    print('Notification body:-${notification.body}');
    print('Notification hashCode:-${notification.hashCode}');
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    if (Platform.isAndroid) {
      notificationSetup();
    } else {
      if (Platform.isIOS) {
        setupInteractedMessage();
      }
    }
    // setupInteractedMessage();
    print('Start check permissions ...');
    await checkPermissions();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void notificationSetup() {
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    print('Push Notification for android in foreground.......');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                //   channel.description,
                color: Colors.white,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: Get.context!,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
    FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    PushNotificationService.getToken();
  }
  //
  // late String token;
  // getToken() async {
  //   token = (await FirebaseMessaging.instance.getToken())!;
  //   print("My Token:-" + token);
  // }

  manageSession() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.LOGIN_TYPE);
  }

  splashDuration() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 2), () {
      if (sharedPreferences.getString(StringConstants.userData) != null) {
        Map<String, dynamic> jsonData =
            jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
        if (jsonData != null) {
          LogInModel userData = LogInModel.fromJson(jsonData);
          if (userData.result!.type == 'User') {
            Get.offAllNamed(Routes.NAVBAR);
          } else {
            Get.offAllNamed(Routes.PROVIDER_NAV_BAR);
          }
        } else {
          Get.offAllNamed(Routes.LOGIN_TYPE);
        }
      } else {
        Get.offAllNamed(Routes.LOGIN_TYPE);
      }
    });
  }

  Future<void> checkPermissions() async {
    // var cameraStatus = await Permission.camera.status;
    if (Platform.isIOS) {
      splashDuration();
    } else if (Platform.isAndroid) {
      var storageStatus = await Permission.manageExternalStorage.status;

      if (storageStatus.isDenied) {
        print('Start check permissions 1 ...');
        // showPermissionDialog();
        requestPermissions();
      } else if (storageStatus.isGranted) {
        print('Start check permissions 2...');
        splashDuration();
      }
    }
  }

  void showPermissionDialog() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Permissions Required',
            style: MyTextStyle.titleStyle20bb,
          ),
          content: Text(
            'This app needs camera and storage permissions to function properly.',
            style: MyTextStyle.titleStyle12blb,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Close App'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Optionally, close the app or do some other action
                  },
                ),
                TextButton(
                  child: Text('Grant'),
                  onPressed: () async {
                    print('Start check permissions 3...');
                    Navigator.of(context).pop();
                    await requestPermissions();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> requestPermissions() async {
    //var cameraStatus = await Permission.camera.request();
    var storageStatus = await Permission.manageExternalStorage.request();

    print('Start check permissions 4...');

    if (storageStatus.isGranted) {
      splashDuration();
    } else {
      requestPermissions();
    }
  }
}
