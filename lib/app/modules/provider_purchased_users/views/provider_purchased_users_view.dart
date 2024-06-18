import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_my_purchased_event_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_purchased_users_controller.dart';

class ProviderPurchasedUsersView
    extends GetView<ProviderPurchasedUsersController> {
  const ProviderPurchasedUsersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.purchasedUser,
          wantBackButton: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showEventBookUserList(),
              ),
            )
          ],
        ));
  }

  /// Show Purchased User List  ...
  Widget showEventBookUserList() {
    return Obx(() => controller.isLoading.value
        ? CommonWidgets.commonShimmer(
            itemCount: 8,
            shimmerWidget: Container(
              height: 95.px,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.px),
                  ),
                  border: Border.all(color: Colors.black87, width: 1.5.px)),
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 3.px, bottom: 3.px),
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(5.0.px),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 15.px,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.px)),
                            ),
                          ),
                          Container(
                            height: 15.px,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.px)),
                            ),
                          ),
                          Container(
                            height: 15.px,
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.px)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 50.px,
                    margin: EdgeInsets.all(5.px),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 15.px,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.px)),
                          ),
                        ),
                        Container(
                          height: 25.px,
                          width: 50.px,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.px)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
        : Column(
            children: [
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.userList.length,
                itemBuilder: (context, int index) {
                  GetMyPurchasingEventResult item = controller.userList[index];
                  return GestureDetector(
                    onTap: () {
                      //controller.openEventDetail(index);
                    },
                    child: Container(
                      height: 95.px,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10.px)),
                      ),
                      margin: EdgeInsets.only(
                          left: 10.px, right: 10.px, top: 3.px, bottom: 3.px),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item.eventName ?? '',
                                        style: MyTextStyle.titleStyle16bw,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 3.px,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            size: 20.px,
                                            color: primary3Color,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${item.fromDate} to ${item.toDate}',
                                              style: MyTextStyle.titleStyle12w,
                                              maxLines: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.px,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 20.px,
                                            color: primary3Color,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${item.fromTime}',
                                              style: MyTextStyle.titleStyle12w,
                                              maxLines: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.px,
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonWidgets.appIcons(
                                          assetName:
                                              IconConstants.icWardrobeBlue,
                                          width: 25.px,
                                          height: 25.px,
                                          fit: BoxFit.fill),
                                      Column(
                                        children: [
                                          CommonWidgets.appIcons(
                                              assetName: IconConstants.icCrown,
                                              width: 25.px,
                                              height: 14.px,
                                              fit: BoxFit.fill),
                                          Text(
                                            '${item.amount} P',
                                            style: MyTextStyle.titleStyle12bb,
                                          )
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 3.px,
                          ),
                          Divider(
                            indent: 0.px,
                            endIndent: 0.px,
                            color: primary3Color,
                            thickness: 1.px,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (controller.userList.isEmpty)
                Padding(
                  padding: EdgeInsets.all(15.px),
                  child: CommonWidgets.dataNotFound(),
                )
            ],
          ));
  }
}
