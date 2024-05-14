import 'package:get/get.dart';

class RequestListHistoryController extends GetxController {
  final showProgressBar = false.obs;

  List<Map<String, String>> currentList = [
    {
      "event": "Birthday Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "people": "+5",
      "status": "Accepted"
    },
    {
      "event": "Friends Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "people": "+2",
      "status": "Rejected"
    },
    {
      "event": "Night Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04-2024-01-10",
      "people": "+1",
      "status": "Accepted"
    },
    {
      "event": "Farewell Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "people": "+5",
      "status": "Rejected"
    },
    {
      "event": "Birthday Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04-2024-01-10",
      "people": "+4",
      "status": "Accepted"
    },
  ];

  List<Map<String, String>> requestList = [
    {
      "event": "Birthday Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "people": "+5",
      "status": "Pending"
    },
    {
      "event": "Friends Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "people": "+2",
      "status": "Pending"
    },
    {
      "event": "Night Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04-2024-01-10",
      "people": "+1",
      "status": "Pending"
    },
    {
      "event": "Farewell Party",
      "name": "Johan Smiths",
      "date": "2024-01-04-2024-01-10",
      "people": "+5",
      "status": "Pending"
    },
    {
      "event": "Birthday Party",
      "name": "Jordyn Bator",
      "date": "2024-01-04-2024-01-10",
      "people": "+4",
      "status": "Pending"
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
