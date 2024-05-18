import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/date_picker.dart';
import '../../../../common/text_styles.dart';
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
  List<DateTime?> datesList = [];
  String fromDate = '', toDate = '';
  String fromTime = '10:00', toTime = '12:00';

  Map<String, String?> parameters = Get.parameters;
  @override
  void onInit() {
    super.onInit();
    startListener();
    setPreviousData();
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

  setPreviousData() {
    eventNameController.text = parameters['event'] ?? '';
    dateController.text = parameters['date'] ?? '';
    timeController.text = parameters['time'] ?? '';

    print("Edit data:-${parameters['name']}");
    increment();
  }

  clickOnDate() async {
    final DateTime? picked = await PickDate.pickDateView(color: primaryColor);
    dateController.text = DateFormat('yyyy-MM-dd').format(picked!);
  }

  clickOnTime() async {
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
              onValueChanged: (dates) => {
                if (dates.length > 1)
                  {changeDateList(dates)}
                else
                  {CommonWidgets.showMyToastMessage("enter minimum 2 days.")}
              },
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
}
