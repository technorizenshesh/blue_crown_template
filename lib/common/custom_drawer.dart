import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/data/apis/api_models/get_login_model.dart';

class CustomDrawer {
  static Widget drawer(LogInModel userData) {
    Map<String, String> data = {
      ApiKeyConstants.userId: userData.result!.id ?? ''
    };
    return Drawer(
      backgroundColor: Colors.black87,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black87,
            ),
            child: Container(
                padding: EdgeInsets.all(5.px),
                margin: EdgeInsets.only(top: 20.px, bottom: 20.px),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(70.px)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 84.px,
                      width: 84.px,
                      child: CommonWidgets.imageView(
                          image: userData.result!.image ?? '',
                          width: 84.px,
                          height: 84.px,
                          borderRadius: BorderRadius.circular(42.px),
                          fit: BoxFit.fill),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.px),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData.result!.fullName ?? '',
                              style: MyTextStyle.titleStyle20bw,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              StringConstants.editAccount,
                              style: MyTextStyle.titleStyle14w,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icChat,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.myProfile,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.MY_PROFILE, parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icClubInfo,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.clubInfo,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.CLUB_INFO, parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icList,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.list,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.REQUEST_LIST_HISTORY,
                          parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icBlueCrown,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.blueCrowns,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.BLUECROWN_POINT, parameters: data);
                    },
                  ),
                  /*  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icChangePassword,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.changePassword,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.CHANGE_PASSWORD, parameters: data);
                    },
                  ),  */
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icNotification,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.notifications,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.NOTIFICATIONS, parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icMyWallet,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.eventWalletHistory,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.EVENT_WALLET_HISTORY,
                          parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icMyPurchased,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.clubEvents,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.CLUB_EVENTS, parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icContact,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.contact,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.CONTACT_US, parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icAboutUs,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.termsAndCondition,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.TERMS_CONDITION, parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icPrivacyPolicy,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.privacyPolicy,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.PRIVACY_POLICY, parameters: data);
                    },
                  ),
                  ListTile(
                    leading: CommonWidgets.appIcons(
                        assetName: IconConstants.icLogout,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.fill),
                    title: Text(
                      StringConstants.logout,
                      style: MyTextStyle.titleStyle14w,
                    ),
                    trailing: CommonWidgets.appIcons(
                        assetName: IconConstants.icRightArrow,
                        height: 24.px,
                        width: 24.px,
                        fit: BoxFit.fill),
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.LOGOUT, parameters: data);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
