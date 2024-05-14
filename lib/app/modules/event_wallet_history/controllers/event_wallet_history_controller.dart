import 'package:get/get.dart';

class EventWalletHistoryController extends GetxController {
  final showProgressBar = false.obs;

  List<Map<String, String>> eventHistoryList = [
    {
      "event": "Birthday Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "amount": "50"
    },
    {
      "event": "Friends Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "amount": "70"
    },
    {
      "event": "Night Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04-2024-01-10",
      "amount": "100"
    },
    {
      "event": "Farewell Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "amount": "30"
    },
    {
      "event": "Birthday Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04-2024-01-10",
      "amount": "80"
    },
  ];

  List<Map<String, String>> walletHistoryList = [
    {
      "event": "Birthday Party",
      "name": "Johan Smiths",
      "date": "2024-01-04",
      "amount": "50"
    },
    {
      "event": "Friends Party",
      "name": "Johan Smiths",
      "date": "2024-01-04",
      "amount": "70"
    },
    {
      "event": "Night Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04",
      "amount": "100"
    },
    {
      "event": "Farewell Party",
      "name": "Johan Smiths",
      "date": "2024-01-04",
      "amount": "30"
    },
    {
      "event": "Birthday Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04",
      "amount": "80"
    },
  ];

  final count = 0.obs;
  final tabIndex = 0.obs;
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

  changeTabIndex(index) {
    tabIndex.value = index;
    increment();
  }
}
