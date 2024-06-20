import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_publish_event_controller.dart';

class ProviderPublishEventView extends GetView<ProviderPublishEventController> {
  const ProviderPublishEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(title: StringConstants.publishEvent),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15.px),
          child: CommonWidgets.commonElevatedButton(
              onPressed: () {
                controller.callingCreateEventsForm();
              },
              child: Text(
                StringConstants.publishEvent,
                style: MyTextStyle.titleStyle16bw,
              ),
              borderRadius: 30.px,
              buttonColor: primaryColor,
              isLoading: controller.isLoading.value),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(10.px),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringConstants.selectEventImage,
                    style: MyTextStyle.titleStyle16w,
                  ),
                ),
                Container(
                  height: 150.px,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 15.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.px),
                      color: Colors.grey.withOpacity(0.5),
                      border: Border.all(color: primary3Color, width: 1.px)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(() => controller.image.value != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10.px),
                              child: Image.file(
                                height: 200.px,
                                fit: BoxFit.fill,
                                File(
                                  controller.image.value!.path.toString(),
                                ),
                              ),
                            )
                          : const SizedBox()),
                      Center(
                        child: IconButton(
                          onPressed: () {
                            controller.showAlertDialog();
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 40.px,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusDate,
                  controller: controller.dateController,
                  isCard: controller.isDate.value,
                  hintText: StringConstants.date,
                  hintStyle: MyTextStyle.titleStyle14blb,
                  style: MyTextStyle.titleStyle16w,
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.openDatePickerBox(context);
                    },
                    child: Icon(
                      Icons.calendar_month,
                      color: primary3Color,
                      size: 20.px,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusTime,
                  controller: controller.timeController,
                  isCard: controller.isTime.value,
                  hintText: StringConstants.time,
                  hintStyle: MyTextStyle.titleStyle14blb,
                  style: MyTextStyle.titleStyle16w,
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.openTimePickerBox(context);
                    },
                    child: Icon(
                      Icons.access_time,
                      color: primary3Color,
                      size: 20.px,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusEventName,
                  controller: controller.eventNameController,
                  isCard: controller.isEventName.value,
                  hintText: StringConstants.eventName,
                  hintStyle: MyTextStyle.titleStyle14blb,
                  style: MyTextStyle.titleStyle16w,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusDescription,
                    controller: controller.descriptionController,
                    isCard: controller.isDescription.value,
                    hintText: StringConstants.description,
                    hintStyle: MyTextStyle.titleStyle14blb,
                    style: MyTextStyle.titleStyle16w,
                    keyboardType: TextInputType.text,
                    maxLines: 7),
                SizedBox(
                  height: 10.px,
                ),
                Padding(
                  padding: EdgeInsets.all(15.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.age,
                        style: MyTextStyle.titleStyle16bw,
                      ),
                      Obx(
                        () => Slider(
                          label: StringConstants.age,
                          value: controller.maxAge.value,
                          activeColor: primaryColor,
                          onChanged: (value) {
                            controller.changeAge(value);
                          },
                          min: controller.minAge.value,
                          max: 100,
                        ),
                      ),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.minAge.value.toStringAsFixed(0),
                                style: MyTextStyle.titleStyle14bw,
                              ),
                              Text(
                                controller.maxAge.value.toStringAsFixed(0),
                                style: MyTextStyle.titleStyle14bw,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 20.px,
                      ),
                      Text(
                        StringConstants.points,
                        style: MyTextStyle.titleStyle16bw,
                      ),
                      Obx(
                        () => Column(
                          children: [
                            Image.asset(
                              IconConstants.icCrown,
                              height: 20.px,
                              width: 30.px,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              controller.points.value.toStringAsFixed(0),
                              style: MyTextStyle.titleStyle16bw,
                            ),
                            Slider(
                              label: StringConstants.points,
                              activeColor: primaryColor,
                              value: controller.points.value,
                              onChanged: (value) {
                                controller.changePoints(value);
                              },
                              min: 0,
                              max: 200,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Text(
                        StringConstants.entranceCost,
                        style: MyTextStyle.titleStyle16bw,
                      ),
                      Obx(
                        () => Column(
                          children: [
                            Image.asset(
                              IconConstants.icCrown,
                              height: 20.px,
                              width: 30.px,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              controller.entraceCost.value.toStringAsFixed(0),
                              style: MyTextStyle.titleStyle16bw,
                            ),
                            Slider(
                              label: StringConstants.entranceCost,
                              activeColor: primaryColor,
                              value: controller.entraceCost.value,
                              onChanged: (value) {
                                controller.changeEntranceCost(value);
                              },
                              min: 0,
                              max: 200,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
