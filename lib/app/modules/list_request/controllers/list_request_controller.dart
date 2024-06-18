import 'dart:convert';

import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/add_request_model.dart';
import '../../../data/apis/api_models/get_login_model.dart';

class ListRequestController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusPerson = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();

  final isName = false.obs;
  final isPerson = false.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final isLoading = false.obs;

  void startListener() {
    focusName.addListener(onFocusChange);
    focusPerson.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isPerson.value = focusPerson.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
  }

  Map<String, dynamic> bodyParamsForRequestListForm = {};
  Map<String, String?> parameters = Get.parameters;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;

  final count = 0.obs;
  final personCount = 1.obs;
  @override
  void onInit() {
    super.onInit();
    getLocalData();
    startListener();
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
  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      userData = LogInModel.fromJson(jsonData);
      emailController.text = userData.result!.email ?? '';
      phoneController.text = userData.result!.mobile ?? '';
      nameController.text = userData.result!.fullName ?? '';
    }
  }

  clickOnPlusIcon() {
    personCount.value = ++personCount.value;
    increment();
    print("personCount:...${personCount.value}");
  }

  clickOnMinusIcon() {
    if (personCount.value > 1) {
      personCount.value = --personCount.value;
      print("personCount:...${personCount.value}");
      increment();
    }
  }

  Future<void> clickOnSendRequestButton() async {
    if (emailController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty) {
      try {
        bodyParamsForRequestListForm = {
          ApiKeyConstants.userId: userData.result!.id,
          ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId],
          ApiKeyConstants.email: emailController.text.toString(),
          ApiKeyConstants.phone: phoneController.text.toString(),
          ApiKeyConstants.people: personCount.value.toString(),
          ApiKeyConstants.name: nameController.text.toString(),
          ApiKeyConstants.manual: StringConstants.no,
          ApiKeyConstants.token: userData.result!.token,
          ApiKeyConstants.type: 'ListRequest',
        };
        print("bodyParamsForGetLogin:::::$bodyParamsForRequestListForm");
        isLoading.value = true;

        AddRequestModel? addRequestModel = await ApiMethods.requestListApi(
            bodyParams: bodyParamsForRequestListForm);
        if (addRequestModel!.status != "0" ?? false) {
          print("Successfully added request ...");
          CommonWidgets.showMyToastMessage(StringConstants.thankYouForRequest);
        } else {
          print("Add request Failed....");
          CommonWidgets.showMyToastMessage(addRequestModel.message!);
        }
      } catch (e) {
        print('Error:-' + e.toString());
        CommonWidgets.showMyToastMessage(
            'Server issue please try again after some time ');
      }
      isLoading.value = false;
    } else {
      CommonWidgets.showMyToastMessage("Please enter all fields...");
    }
  }
}
