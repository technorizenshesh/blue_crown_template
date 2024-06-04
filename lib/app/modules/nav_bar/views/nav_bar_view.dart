import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/custom_drawer.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          drawer: controller.isLoading.value
              ? null
              : CustomDrawer.drawer(controller.userData),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          floatingActionButton: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                print("hiii....");
                Scaffold.of(context).openDrawer();
              },
              child: CommonWidgets.appIcons(
                assetName: IconConstants.icMenu,
                height: 25.px,
                width: 25.px,
                fit: BoxFit.fill,
              ),
            );
          }),
          bottomNavigationBar: Container(
            height: 85.px,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(color: Colors.black87),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.px),
                  child: CommonWidgets.appIcons(
                      assetName: ImageConstants.imageBottomBar,
                      fit: BoxFit.fill,
                      height: 70.px,
                      width: double
                          .infinity //MediaQuery.of(context).size.width + 40.px,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 18.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.changeIndex(0);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.px,
                            ),
                            CommonWidgets.appIcons(
                              assetName: controller.tabIndex.value == 0
                                  ? IconConstants.icWardrobeBlue
                                  : IconConstants.icWardrobe,
                              fit: BoxFit.cover,
                              height: 25.px,
                              width: 25.px,
                            ),
                            Text(
                              StringConstants.wardrobe,
                              style: controller.tabIndex.value == 0
                                  ? MyTextStyle.titleStyleCustom(
                                      14, FontWeight.normal, primaryColor)
                                  : MyTextStyle.titleStyle14w,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50.px,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.changeIndex(2);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.px,
                            ),
                            CommonWidgets.appIcons(
                              assetName: IconConstants.icScanner,
                              fit: BoxFit.cover,
                              height: 25.px,
                              width: 25.px,
                            ),
                            Text(
                              StringConstants.scanner,
                              style: controller.tabIndex.value == 2
                                  ? MyTextStyle.titleStyleCustom(
                                      14, FontWeight.normal, primaryColor)
                                  : MyTextStyle.titleStyle14w,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.changeIndex(1);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.px),
                    child: CommonWidgets.appIcons(
                      assetName: IconConstants.icHome,
                      fit: BoxFit.fill,
                      height: 70.px,
                      width: 70.px,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: controller.pages[controller.tabIndex.value]);
    });
  }
}
