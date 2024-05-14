import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ClubEventsController extends GetxController {
  final showEventsProgressBar = false.obs;

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
    {
      "name": "BirthDay Party",
      "date": "2024-01-01 to 2024-01-15",
      "time": "10:00 - 12:00 PM",
      "location": "indore,Madhya Pradesh",
      "amount": "50 P"
    },
    {
      "name": "Anniversary Party",
      "date": "2024-04-20 to 2024-01-25",
      "time": "2:00 - 7:00 PM",
      "location": "Bhopal,Madhya Pradesh",
      "amount": "70 P"
    },
  ];

  final count = 0.obs;
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

  clickOnEvent(int index) {
    Get.toNamed(Routes.USE_POINTS);
  }
}
