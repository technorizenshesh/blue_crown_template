import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_all_user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_consumer_list_controller.dart';

class ProviderConsumerListView extends GetView<ProviderConsumerListController> {
  const ProviderConsumerListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: CommonWidgets.appBar(title: StringConstants.clubConsumerList),
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
    return GetBuilder<ProviderConsumerListController>(builder: (context) {
      return Obx(() => controller.inAsyncCall.value
          ? CommonWidgets.commonShimmer(
              itemCount: 8,
              shimmerWidget: Container(
                height: 80.px,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    border: Border.all(color: Colors.black87, width: 1.5.px)),
                margin: EdgeInsets.only(
                    left: 5.px, right: 5.px, top: 5.px, bottom: 2.px),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Container(
                      height: 60.px,
                      width: 60.px,
                      margin: EdgeInsets.all(5.px),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(30.px)),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 15.px,
                          width: 230.px,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.px)),
                          ),
                        ),
                        Container(
                          height: 15.px,
                          width: 120.px,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.px)),
                          ),
                        ),
                        Container(
                          height: 15.px,
                          width: 200.px,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.px)),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ))
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: controller.filterUserList.length,
              itemBuilder: (context, int index) {
                AllUsersResult item = controller.filterUserList[index];
                return GestureDetector(
                  onTap: () {
                    showAlertBox(context, item);
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
                                  child: CommonWidgets.imageView(
                                      image: item.image ?? '',
                                      width: 60.px,
                                      height: 60.px,
                                      borderRadius:
                                          BorderRadius.circular(30.px),
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
                                        item.fullName ?? '',
                                        style: MyTextStyle.titleStyle16bw,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 3.px,
                                      ),
                                      Text(
                                        item.mobile ?? '',
                                        style: MyTextStyle.titleStyle12w,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 3.px,
                                      ),
                                      Text(
                                        item.email ?? '',
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
  void showAlertBox(BuildContext context, AllUsersResult user) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: SizedBox(
          height: 280.px,
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
                  subtitle: Text(user.fullName ?? '',
                      style: MyTextStyle.titleStyle14w),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                  title: Text('Email', style: MyTextStyle.titleStyle16bw),
                  subtitle:
                      Text(user.email ?? '', style: MyTextStyle.titleStyle14w),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                  title:
                      Text('Phone Number', style: MyTextStyle.titleStyle16bw),
                  subtitle:
                      Text(user.mobile ?? '', style: MyTextStyle.titleStyle14w),
                ),
              ],
            ),
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
