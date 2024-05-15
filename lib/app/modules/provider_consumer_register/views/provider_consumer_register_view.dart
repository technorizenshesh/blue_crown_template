import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_consumer_register_controller.dart';

class ProviderConsumerRegisterView
    extends GetView<ProviderConsumerRegisterController> {
  const ProviderConsumerRegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: CommonWidgets.appBar(title: StringConstants.consumerRegister),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(15.px),
            child: Column(
              children: [
                CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusSearch,
                  controller: controller.searchController,
                  isCard: controller.isSearch.value,
                  hintText: StringConstants.search,
                  hintStyle: MyTextStyle.titleStyle14w,
                  style: MyTextStyle.titleStyle14w,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(
                    Icons.search,
                    color: primary3Color,
                    size: 20.px,
                  ),
                  onChanged: (text) {
                    controller.changeFilterUsersList(
                        controller.searchController.text);
                  },
                ),
                SizedBox(
                  height: 20.px,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: showUserList(),
                  ),
                )
              ],
            ),
          );
        }));
  }

  /// Show user List ...
  Widget showUserList() {
    return GetBuilder<ProviderConsumerRegisterController>(builder: (context) {
      return Obx(() => controller.showProgressBar.value
          ? CommonWidgets.commonShimmer(
              itemCount: 4,
              shimmerWidget: Container(
                height: 80.px,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10.px)),
                ),
                margin: EdgeInsets.only(
                    left: 5.px, right: 5.px, top: 5.px, bottom: 2.px),
                clipBehavior: Clip.hardEdge,
              ))
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: controller.filterUserList.length,
              itemBuilder: (context, int index) {
                //  GetClubsResult item = controller.getClubsModel!.result![index];
                return GestureDetector(
                  onTap: () {
                    showAlertBox(context, controller.filterUserList[index]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    ),
                    color: backgroundColor,
                    clipBehavior: Clip.hardEdge,
                    elevation: 2.px,
                    margin: EdgeInsets.only(
                      left: 5.px,
                      right: 5.px,
                    ),
                    child: Container(
                        height: 85.px,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(2.px),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px)),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CommonWidgets.appIcons(
                                      assetName: controller
                                              .filterUserList[index]['image'] ??
                                          '',
                                      width: 60.px,
                                      height: 60.px,
                                      borderRadius: 30.px,
                                      fit: BoxFit.fill),
                                )),
                            Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5.px),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.filterUserList[index]
                                                ['name'] ??
                                            '',
                                        style: MyTextStyle.titleStyle16bw,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 3.px,
                                      ),
                                      Text(
                                        controller.filterUserList[index]
                                                ['phone'] ??
                                            '',
                                        style: MyTextStyle.titleStyle12w,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 3.px,
                                      ),
                                      Text(
                                        controller.filterUserList[index]
                                                ['email'] ??
                                            '',
                                        style: MyTextStyle.titleStyle12w,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                  ),
                );
              },
            ));
    });
  }

  /// Show Alert Box...
  void showAlertBox(BuildContext context, Map<String, String> user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: SizedBox(
          height: 355.px,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.px))),
            elevation: 5.px,
            color: cartColor,
            margin: EdgeInsets.all(1.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.px,
                ),
                Text(
                  StringConstants.consumerRegister,
                  style: MyTextStyle.titleStyle20bw,
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                  title: Text('Name', style: MyTextStyle.titleStyle16bw),
                  subtitle: Text(user['name'] ?? '',
                      style: MyTextStyle.titleStyle14w),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                  title: Text('Email', style: MyTextStyle.titleStyle16bw),
                  subtitle: Text(user['email'] ?? '',
                      style: MyTextStyle.titleStyle14w),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                  title: Text('Status', style: MyTextStyle.titleStyle16bw),
                  subtitle: Text('Active',
                      style: MyTextStyle.titleStyleCustom(
                          14, FontWeight.normal, greenColor)),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            StringConstants.reject,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          borderRadius: 30.px,
                          height: 50.px,
                          buttonColor: errorColor,
                          buttonMargin: EdgeInsets.only(
                              top: 20.px,
                              left: 20.px,
                              right: 20.px,
                              bottom: 20.px)),
                    ),
                    Expanded(
                      flex: 1,
                      child: CommonWidgets.commonElevatedButton(
                          onPressed: () {},
                          child: Text(
                            StringConstants.register,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          borderRadius: 30.px,
                          height: 50.px,
                          buttonColor: primaryColor,
                          buttonMargin: EdgeInsets.only(
                              top: 20.px,
                              left: 20.px,
                              right: 20.px,
                              bottom: 20.px)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
