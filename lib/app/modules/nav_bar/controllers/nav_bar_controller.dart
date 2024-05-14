import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/home_view.dart';
import '../../screens/scanner_view.dart';
import '../../wardrobe/views/wardrobe_view.dart';

class NavBarController extends GetxController {
  final count = 0.obs;
  final tabIndex = 1.obs;
  List<Widget> pages = [
    const WardrobeView(),
    const HomeView(),
    const ScannerView()
  ];
  @override
  void onInit() {
    super.onInit();
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
}
