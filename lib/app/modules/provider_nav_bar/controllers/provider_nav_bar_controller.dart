import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../screens/home_view.dart';
import '../../screens/scanner_view.dart';
import '../../wardrobe/views/wardrobe_view.dart';

class ProviderNavBarController extends GetxController {
  final showEventsProgressBar = false.obs;
  final count = 0.obs;
  final tabIndex = 1.obs;
  List<Widget> pages = [
    const WardrobeView(),
    const HomeView(),
    const ScannerView()
  ];

  List<String> eventsImages = [
    'assets/un_used_images/party1.png',
    'assets/un_used_images/party2.png',
    'assets/un_used_images/party3.png',
    'assets/un_used_images/party4.png',
    'assets/un_used_images/party1.png',
    'assets/un_used_images/party2.png'
  ];
  List<Map<String, String>> eventsDetails = [
    {
      "name": "BirthDay Party",
      "date": "2024-01-01 to 2024-01-15",
      "time": "10:00 - 12:00 PM",
      "location": "indore,Madhya Pradesh",
      "amount": "50 P"
    },
    {
      "name": "Night Party",
      "date": "2024-02-18 to 2024-02-25",
      "time": "10:00 - 12:00 PM",
      "location": "indore,Madhya Pradesh",
      "amount": "120 P"
    },
    {
      "name": "Farewell Party",
      "date": "2024-08-01",
      "time": "6:00 - 12:00 PM",
      "location": "indore,Madhya Pradesh",
      "amount": "80 P"
    },
    {
      "name": "Friend Party",
      "date": "2024-03-10 to 2024-03-15",
      "time": "10:00 - 12:30 AM",
      "location": "indore,Madhya Pradesh",
      "amount": "100 P"
    },
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
    switch (index) {
      case 0:
        //showEventsProgressBar.value = true;
        break;
      case 1:
        //showEventsProgressBar.value = false;
        break;
      case 2:
        Get.toNamed(Routes.PROVIDER_CONSUMER_REGISTER);
        break;
    }
  }

  openEventDetail(int index, String type) {
    Map<String, String> data = {
      "image": eventsImages[index],
      "type": type,
      "event": eventsDetails[index]['name'] ?? '',
    };
    Get.toNamed(Routes.PROVIDER_EVENT_DETAIL, parameters: data);
  }
}
