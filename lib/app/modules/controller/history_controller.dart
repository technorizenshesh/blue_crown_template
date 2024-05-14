import 'package:get/get.dart';

class HistoryController extends GetxController {
  final showEventsProgressBar = false.obs;

  List<Map<String, String>> jacketHistory = [
    {
      "name": "BirthDay Party",
      "date": "2024-01-01 to 2024-01-15",
      "time": "10:00 - 12:00 PM",
      "amount": "50 P"
    },
    {
      "name": "Night Party",
      "date": "2024-02-18 to 2024-02-25",
      "time": "10:00 - 12:00 PM",
      "amount": "120 P"
    },
    {
      "name": "Farewell Party",
      "date": "2024-08-01",
      "time": "6:00 - 12:00 PM",
      "amount": "80 P"
    },
    {
      "name": "Friend Party",
      "date": "2024-03-10 to 2024-03-15",
      "time": "10:00 - 12:30 AM",
      "amount": "100 P"
    },
    {
      "name": "BirthDay Party",
      "date": "2024-01-01 to 2024-01-15",
      "time": "10:00 - 12:00 PM",
      "amount": "50 P"
    },
    {
      "name": "Anniversary Party",
      "date": "2024-04-20 to 2024-01-25",
      "time": "2:00 - 7:00 PM",
      "amount": "70 P"
    },
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("hiii sir .....");
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
}
