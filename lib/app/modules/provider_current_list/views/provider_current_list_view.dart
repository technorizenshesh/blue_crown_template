import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_current_list_controller.dart';

class ProviderCurrentListView extends GetView<ProviderCurrentListController> {
  const ProviderCurrentListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.currentList,
          wantBackButton: true,
        ),
        bottomNavigationBar: CommonWidgets.commonElevatedButton(
            onPressed: () {},
            child: Text(
              StringConstants.download,
              style: MyTextStyle.titleStyle14bw,
            ),
            borderRadius: 30.px,
            buttonColor: primaryColor,
            buttonMargin:
                EdgeInsets.only(left: 10.px, right: 10.px, bottom: 10.px)),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(5.px),
            child: Column(
              children: [
                SizedBox(height: 10.px),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: currentList(),
                  ),
                )
              ],
            ),
          );
        }));
  }

  /// Show Current List   ...
  Widget currentList() {
    return Obx(() => controller.showProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 4,
            shimmerWidget: Container(
              height: 200.px,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10.px)),
              ),
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 5.px, bottom: 2.px),
              clipBehavior: Clip.hardEdge,
            ))
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.currentList.length,
            itemBuilder: (context, int index) {
              //  GetClubsResult item = controller.getClubsModel!.result![index];
              return GestureDetector(
                onTap: () {
                  //controller.openEventDetail(index);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  color: cartColor,
                  clipBehavior: Clip.hardEdge,
                  elevation: 5.px,
                  margin: EdgeInsets.only(
                      left: 10.px, right: 10.px, top: 5.px, bottom: 5.px),
                  child: Container(
                    height: 75.px,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(2.px),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      title: Text(
                        controller.currentList[index]['name'] ?? '',
                        style: MyTextStyle.titleStyle16bw,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        controller.currentList[index]['date'] ?? '',
                        style: MyTextStyle.titleStyle14w,
                        maxLines: 1,
                      ),
                      trailing: Text(
                        controller.currentList[index]['people'] ?? '',
                        style: MyTextStyle.titleStyle16bw,
                      ),
                    ),
                  ),
                ),
              );
            },
          ));
  }
}
