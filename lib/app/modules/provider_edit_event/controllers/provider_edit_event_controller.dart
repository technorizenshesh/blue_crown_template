import 'dart:convert';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/date_picker.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_add_event_model.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';

class ProviderEditEventController extends GetxController {
  RxBool showNearEventsProgressBar = false.obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FocusNode focusDescription = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusDate = FocusNode();
  FocusNode focusEventName = FocusNode();
  FocusNode focusStyle = FocusNode();
  final count = 0.obs;
  final RxDouble maxAge = 80.0.obs;
  final RxDouble minAge = 18.0.obs;
  final RxDouble points = 50.0.obs;
  final RxDouble entraceCost = 70.0.obs;
  final isDescription = false.obs;
  final isTime = false.obs;
  final isDate = false.obs;
  final isEventName = false.obs;
  final isStyle = false.obs;
  final isLoading = false.obs;
  List<DateTime?> datesList = [];
  String fromDate = '', toDate = '';
  String fromTime = '10:00', toTime = '12:00';
  Map<String, String> bodyParamsForEditEventsForm = {};
  GetEventsResult getEventsResult = Get.arguments;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  @override
  void onInit() {
    super.onInit();
    startListener();
    setPreviousData();
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

  changeAge(double value) {
    maxAge.value = value;
  }

  changePoints(double value) {
    points.value = value;
  }

  changeEntranceCost(double value) {
    entraceCost.value = value;
  }

  void startListener() {
    focusEventName.addListener(onFocusChange);
    focusTime.addListener(onFocusChange);
    focusDate.addListener(onFocusChange);
    focusStyle.addListener(onFocusChange);
    focusDescription.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEventName.value = focusEventName.hasFocus;
    isTime.value = focusTime.hasFocus;
    isDate.value = focusDate.hasFocus;
    isStyle.value = focusStyle.hasFocus;
    isDescription.value = focusDescription.hasFocus;
  }

  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    userData = LogInModel.fromJson(jsonData);
  }

  setPreviousData() {
    eventNameController.text = getEventsResult.name ?? '';
    descriptionController.text = getEventsResult.description ?? '';
    dateController.text =
        '${getEventsResult.fromDate} to ${getEventsResult.toDate}';
    timeController.text = '${getEventsResult.fromTime}';
    fromTime = '${getEventsResult.fromTime}';
    toTime = '${getEventsResult.fromTime}';
    fromDate = '${getEventsResult.fromDate}';
    toDate = '${getEventsResult.toDate}';
    increment();
  }

  clickOnDate() async {
    final DateTime? picked = await PickDate.pickDateView(color: primaryColor);
    dateController.text = DateFormat('yyyy-MM-dd').format(picked!);
  }

  changeDateList(List<DateTime?> dataList) {
    datesList = dataList;
    String dateStr = datesList[0].toString().substring(0, 10) +
        " to " +
        datesList[datesList.length - 1].toString().substring(0, 10);
    fromDate = datesList[0].toString().substring(0, 10);
    toDate = datesList[datesList.length - 1].toString().substring(0, 10);
    dateController.value = TextEditingValue(text: dateStr);
    update();
  }

  changeTime() {
    timeController.text = '$fromTime to $toTime';
    increment();
  }

  /// Show Date Picker Box...
  void openDatePickerBox(BuildContext context) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 15.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: Container(
            height: 230.px,
            width: MediaQuery.of(context).size.width - 60.px,
            padding: EdgeInsets.all(10.px),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                dayTextStyle: MyTextStyle.titleStyle14b,
                calendarType: CalendarDatePicker2Type.range,
              ),
              value: datesList,
              onValueChanged: (dates) => {changeDateList(dates)},
            )),
        alignment: Alignment.center,
        actions: <Widget>[
          CommonWidgets.commonElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                StringConstants.submit,
                style: MyTextStyle.titleStyle14bw,
              ),
              buttonMargin: EdgeInsets.all(2.px),
              buttonColor: primaryColor,
              height: 40.px,
              borderRadius: 30.px),
        ],
      ),
    );
  }

  /// Show Time Picker Box...
  void openTimePickerBox(BuildContext context) async {
    showTimeRangePicker(
      context: context,
      start: const TimeOfDay(hour: 10, minute: 00),
      onStartChange: (start) {
        fromTime = '${start.hour}:${start.minute}';
        print("start time ${start.hour}:${start.minute}");
        changeTime();
      },
      onEndChange: (end) {
        toTime = '${end.hour}:${end.minute}';
        print("end time ${end.hour}:${end.minute}");
        changeTime();
      },
      interval: const Duration(minutes: 10),
      minDuration: const Duration(hours: 1),
      use24HourFormat: true,
      padding: 30,
      strokeWidth: 20,
      handlerRadius: 14,
      strokeColor: Colors.orange,
      handlerColor: Colors.orange[700],
      selectedColor: Colors.amber,
      backgroundColor: Colors.black.withOpacity(0.3),
      ticks: 24,
      ticksColor: Colors.white,
      snap: true,
      labels: [
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "20",
        "21",
        "22",
        "23"
      ].asMap().entries.map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 24, text: e.value);
      }).toList(),
      labelOffset: -30,
      labelStyle: const TextStyle(
          fontSize: 12, color: Colors.grey, fontWeight: FontWeight.normal),
      timeTextStyle: TextStyle(
          color: Colors.orange[700],
          fontSize: 24,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
      activeTimeTextStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 26,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold),
    );
  }

  Future<void> callingEditEventsForm() async {
    if (eventNameController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty) {
      try {
        bodyParamsForEditEventsForm = {
          ApiKeyConstants.userId: userData.result!.id ?? '',
          ApiKeyConstants.eventId: getEventsResult.id ?? '',
          ApiKeyConstants.token: userData.result!.token ?? '',
          ApiKeyConstants.name: eventNameController.text.toString(),
          ApiKeyConstants.style: styleController.text.toString(),
          ApiKeyConstants.description: descriptionController.text.toString(),
          ApiKeyConstants.fromDate: fromDate,
          ApiKeyConstants.toDate: toDate,
          ApiKeyConstants.minAge: minAge.value.toString(),
          ApiKeyConstants.maxAge: maxAge.value.toString(),
          ApiKeyConstants.points: points.value.toStringAsFixed(0),
          ApiKeyConstants.fromTime: timeController.text.toString(),
          ApiKeyConstants.entranceCost: entraceCost.value.toStringAsFixed(0),
        };
        isLoading.value = true;
        print(
            "bodyParamsForGetEditEventParams:::::$bodyParamsForEditEventsForm");
        AddEventModel? addEventModel = await ApiMethods.editEventsApi(
            bodyParams: bodyParamsForEditEventsForm);
        if (addEventModel!.status != "0" ?? false) {
          print("Edit events Successfully complete...");
          Get.back();
          Get.back(result: true);
        } else {
          print("Edit events Failed....");
        }
      } catch (e) {
        isLoading.value = false;
        print('Error :-${e.toString()}');
        CommonWidgets.showMyToastMessage(
            'Event name,description and image are required..');
      }
    } else {
      CommonWidgets.showMyToastMessage('Please enter all fields...');
    }
    isLoading.value = false;
  }
}
