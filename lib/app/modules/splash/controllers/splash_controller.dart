import 'dart:async';
import 'dart:convert';

import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late SharedPreferences sharedPreferences;
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    // await splashDuration();
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
