import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../home/views/home_view.dart';
import '../../scanner/views/scanner_view.dart';
import '../../wardrobe/views/wardrobe_view.dart';

class NavBarController extends GetxController {
  final count = 0.obs;
  final tabIndex = 1.obs;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  final isLoading = true.obs;
  List<Widget> pages = [
    const WardrobeView(),
    const HomeView(),
    const ScannerView()
  ];
  @override
  void onInit() {
    super.onInit();
    getLocalData();
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

  changeIndex(int index) {
    tabIndex.value = index;
    increment();
  }

  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      userData = LogInModel.fromJson(jsonData);
      isLoading.value = false;
      increment();
    }
  }
}
