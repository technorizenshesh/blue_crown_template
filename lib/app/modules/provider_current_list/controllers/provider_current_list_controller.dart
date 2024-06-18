import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_club_request_model.dart';
import '../../../data/constants/string_constants.dart';

class ProviderCurrentListController extends GetxController {
  final showListProgressBar = true.obs;
  final showTableProgressBar = true.obs;
  final isLoading = false.obs;
  List<Map<String, String>> listOfJson = [];
  ClubRequestResult? listRequestResult;
  ClubRequestResult? tableRequestResult;
  Map<String, String?> parameters = Get.parameters;
  final tabIndex = 0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getListRequestList();
    getTableRequestList();
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

  changeTabIndex(index) {
    tabIndex.value = index;
    increment();
  }

  Future<void> getListRequestList() async {
    try {
      Map<String, String> bodyParamsForListRequests = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.clubId] ?? '',
        ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId] ?? '',
        ApiKeyConstants.type: 'ListRequest',
        ApiKeyConstants.status: 'Accept'
      };
      print("bodyParamsForListRequests:::::$bodyParamsForListRequests");
      showListProgressBar.value = true;

      ClubRequestModel? clubRequestModel =
          await ApiMethods.getClubRequestListApi(
              bodyParams: bodyParamsForListRequests);
      if (clubRequestModel!.status != "0" ?? false) {
        listRequestResult = clubRequestModel.result!;
        CommonWidgets.showMyToastMessage(StringConstants.thankYouForRequest);
        print(
            "Successfully get  request  list ... ${listRequestResult!.eventReqData!.length.toString()}");
      } else {
        print("Add request Failed....");
        CommonWidgets.showMyToastMessage(clubRequestModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage(
          'Server issue please try again after some time ');
    }
    showListProgressBar.value = false;
    increment();
  }

  Future<void> getTableRequestList() async {
    try {
      Map<String, String> bodyParamsForTableRequests = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.clubId] ?? '',
        ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId] ?? '',
        ApiKeyConstants.type: 'TableBooking',
        ApiKeyConstants.status: 'Accept'
      };
      print("bodyParamsForTableRequests:::::$bodyParamsForTableRequests");
      showTableProgressBar.value = true;

      ClubRequestModel? clubRequestModel =
          await ApiMethods.getClubRequestListApi(
              bodyParams: bodyParamsForTableRequests);
      if (clubRequestModel!.status != "0" ?? false) {
        tableRequestResult = clubRequestModel.result!;
        CommonWidgets.showMyToastMessage(StringConstants.thankYouForRequest);
      } else {
        print("Add request Failed....");
        CommonWidgets.showMyToastMessage(clubRequestModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage(
          'Server issue please try again after some time ');
    }
    showTableProgressBar.value = false;
    increment();
  }

  Future<void> convertJsonTableRequest() async {
    for (int i = 0; i < tableRequestResult!.eventReqData!.length; i++) {
      listOfJson.add({
        "name": "${tableRequestResult!.eventReqData![i].name}",
        "email": "${tableRequestResult!.eventReqData![i].email}",
        "phone": "${tableRequestResult!.eventReqData![i].phone}",
        "date":
            "${tableRequestResult!.eventReqData![i].dateTime.toString().substring(0, 10)}"
      });
    }
  }

  Future<void> convertJsonListRequest() async {
    for (int i = 0; i < tableRequestResult!.eventReqData!.length; i++) {
      listOfJson.add({
        "name": "${tableRequestResult!.eventReqData![i].name}",
        "email": "${tableRequestResult!.eventReqData![i].email}",
        "phone": "${tableRequestResult!.eventReqData![i].phone}",
        "date":
            "${tableRequestResult!.eventReqData![i].dateTime.toString().substring(0, 10)}"
      });
    }
  }

  clickOnDownloadButton() {
    if (tabIndex.value == 0) {
      if (listRequestResult!.eventReqData!.isNotEmpty) {
        jsonToExcel();
      } else {
        CommonWidgets.showMyToastMessage('Current list user not present.');
      }
    } else {
      if (tableRequestResult!.eventReqData!.isNotEmpty) {
        jsonToExcel();
      } else {
        CommonWidgets.showMyToastMessage('Current table user not present.');
      }
    }
  }

  Future<void> jsonToExcel() async {
    isLoading.value = true;
    tabIndex.value == 0
        ? await convertJsonListRequest()
        : await convertJsonTableRequest();
    String jsonData = jsonEncode(listOfJson).toString();
    var status = await Permission.storage.request();
    var storageStatus = await Permission.manageExternalStorage.request();

    if (status.isGranted || storageStatus.isGranted) {
      List<dynamic> data = jsonDecode(jsonData);
      var excel = Excel.createExcel();
      Sheet sheetObject = excel['Sheet1'];

      // Add column headers (optional)
      List<String> headers = data[0].keys.toList();
      sheetObject.appendRow(headers);

      for (var item in data) {
        List<dynamic> row = [];
        item.forEach((key, value) {
          row.add(value);
        });
        sheetObject.appendRow(row);
      }

      Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');
      if (downloadsDirectory != null) {
        String shortFileName = '';
        if (tabIndex.value == 0) {
          shortFileName =
              'BlueCrown_${listRequestResult!.name!.removeAllWhitespace}_list';
        } else {
          shortFileName =
              'BlueCrown_${tableRequestResult!.name!.removeAllWhitespace}_table';
        }
        String filePath = "${downloadsDirectory.path}/$shortFileName.xlsx";
        var fileBytes = excel.save(fileName: filePath);

        // Write the file to disk
        File(filePath)
          ..createSync(recursive: true)
          ..writeAsBytesSync(fileBytes!);

        print("Excel file saved at: $filePath");
        CommonWidgets.showMyToastMessage('Excel file saved at: $filePath');
      } else {
        print("Failed to get downloads directory");
      }
    } else {
      CommonWidgets.showMyToastMessage(
          'Download permission is denied ,please go to setting and give permission');
      print("Permission denied");
    }
    isLoading.value = false;
  }
}
