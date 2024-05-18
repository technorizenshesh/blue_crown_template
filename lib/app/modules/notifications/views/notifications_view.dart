import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: CommonWidgets.appBar(
            title: StringConstants.notifications,
            actions: [
              Padding(
                padding: EdgeInsets.all(10.px),
                child: GestureDetector(
                  onTap: () {
                    controller.clickOnSettingIcon();
                  },
                  child: Icon(
                    Icons.settings,
                    color: primary3Color,
                    size: 25.px,
                  ),
                ),
              )
            ]),
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
    return GetBuilder<NotificationsController>(builder: (context) {
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
                    //showAlertBox(context, controller.filterUserList[index]);
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
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.px, vertical: 1.px),
                      title: Text(
                        controller.filterUserList[index]['message'] ?? '',
                        style: MyTextStyle.titleStyle14w,
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        controller.filterUserList[index]['type'] ?? '',
                        style: MyTextStyle.titleStyle12bb,
                      ),
                      trailing: Text(
                        controller.filterUserList[index]['time'] ?? '',
                        style: MyTextStyle.titleStyle12bw,
                      ),
                    ),
                  ),
                );
              },
            ));
    });
  }
}
