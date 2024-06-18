import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_pickImage.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/date_picker.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class MyProfileController extends GetxController {
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusDob = FocusNode();
  final isFullName = true.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final isDob = false.obs;
  final checkBox = false.obs;
  final profileImage = ''.obs;
  final selectImage = Rxn<File>();

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isDob.value = focusDob.hasFocus;
  }

  final isLoading = false.obs;
  Map<String, File> imageMap = {};
  Map<String, dynamic> bodyParamsForUpdateProfile = {};

  final count = 0.obs;

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
      fullNameController.text = userData.result!.fullName ?? '';
      emailController.text = userData.result!.email ?? '';
      phoneController.text = userData.result!.mobile ?? '';
      dobController.text = userData.result!.dob ?? '';
      profileImage.value = userData.result!.image ?? '';
    }
    increment();
  }

  clickOnChangeButton() {
    Map<String, String> data = {
      ApiKeyConstants.userId: userData.result!.id ?? ''
    };
    Get.toNamed(Routes.CHANGE_PASSWORD, parameters: data);
  }

  clickOnDate() async {
    final DateTime? picked = await PickDate.pickDateView(color: primaryColor);
    dobController.text = DateFormat('yyyy-MM-dd').format(picked!);
  }

  void showAlertDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectImageTextView() => Text(
        StringConstants.selectImage,
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 18.px),
      );

  Widget contentTextView() => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        style: Theme.of(Get.context!)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px),
      );

  Widget cameraTextButtonView() => Text(
        StringConstants.camera,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Widget galleryTextButtonView() => Text(
        StringConstants.gallery,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Future<void> clickCameraTextButtonView() async {
    pickCamera();
    Get.back();
  }

  Future<void> clickGalleryTextButtonView() async {
    pickGallery();
    Get.back();
  }

  Future<void> pickCamera() async {
    selectImage.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );
    increment();
  }

  Future<void> pickGallery() async {
    selectImage.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);
    increment();
  }

  Future<void> callingUpdateProfile() async {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        dobController.text.isNotEmpty) {
      try {
        if (selectImage.value != null) {
          imageMap = {
            ApiKeyConstants.image: selectImage.value ?? File(''),
          };
          bodyParamsForUpdateProfile = {
            ApiKeyConstants.userId: userData.result!.id,
            ApiKeyConstants.token: userData.result!.token,
            ApiKeyConstants.fullName: fullNameController.text.toString(),
            ApiKeyConstants.mobile: phoneController.text.toString(),
            ApiKeyConstants.dob: dobController.text.toString(),
          };
        } else {
          bodyParamsForUpdateProfile = {
            ApiKeyConstants.userId: userData.result!.id,
            ApiKeyConstants.token: userData.result!.token,
            ApiKeyConstants.fullName: fullNameController.text.toString(),
            ApiKeyConstants.mobile: phoneController.text.toString(),
            ApiKeyConstants.dob: dobController.text.toString(),
            ApiKeyConstants.image: '',
          };
        }
        isLoading.value = true;
        print(
            "bodyParamsForUpdateProfileParams:::::$bodyParamsForUpdateProfile");
        LogInModel? logInModel = await ApiMethods.updateProfileApi(
            bodyParams: bodyParamsForUpdateProfile, imageMap: imageMap);
        if (logInModel!.status != "0" ?? false) {
          saveDataSharedPreference(logInModel);
          CommonWidgets.showMyToastMessage(logInModel.message!);
        } else {
          isLoading.value = false;
          print("Profile Update Failed....");
          CommonWidgets.showMyToastMessage(logInModel.message!);
        }
      } catch (e) {
        isLoading.value = false;
        print('Error :-${e.toString()}');
        CommonWidgets.showMyToastMessage(e.toString());
      }
    } else {
      CommonWidgets.showMyToastMessage('Please enter all fields...');
    }
  }

  saveDataSharedPreference(LogInModel? userdata) async {
    sharedPreferences = await SharedPreferences.getInstance();
    print("LogIn Successfully complete...");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    isLoading.value = false;
  }
}
