import 'dart:convert';
import 'dart:io';

import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/data/apis/api_models/get_all_user_model.dart';
import 'package:blue_crown_template/app/data/apis/api_models/get_club_info_model.dart';
import 'package:blue_crown_template/app/data/apis/api_models/get_event_model.dart';
import 'package:blue_crown_template/app/data/apis/api_models/get_my_notification_model.dart';
import 'package:blue_crown_template/app/data/apis/api_models/get_request_model.dart';
import 'package:blue_crown_template/app/data/apis/api_models/get_wallet_model.dart';
import 'package:http/http.dart' as http;

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/add_request_model.dart';
import '../api_models/get_add_club_customer_model.dart';
import '../api_models/get_add_event_model.dart';
import '../api_models/get_add_hanger_model.dart';
import '../api_models/get_club_hanger.dart';
import '../api_models/get_club_request_model.dart';
import '../api_models/get_common_response_model.dart';
import '../api_models/get_current_jacket_model.dart';
import '../api_models/get_hand_jacket_model.dart';
import '../api_models/get_how_get_points_model.dart';
import '../api_models/get_login_model.dart';
import '../api_models/get_my_purchased_event_model.dart';
import '../api_models/get_otp_model.dart';
import '../api_models/get_purchase_event_model.dart';
import '../api_models/get_scan_event_qr_model.dart';

class ApiMethods {
  /// Registration Api Calling .....
  static Future<LogInModel?> submitRegistrationForm({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? signUpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSignUp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      signUpModel = LogInModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }

  ///Login Api Calling.....
  static Future<LogInModel?> logInApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      wantSnackBar: false,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }

  ///GetProfile Api Calling.....
  static Future<LogInModel?> getProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetProfile,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }

  ///Update Profile Api Calling.....
  static Future<LogInModel?> updateProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    Map<String, File>? imageMap,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateProfile,
      imageMap: imageMap,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }

  ///Check Otp Api Calling.....
  static Future<CheckOtpModel?> checkOtpApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CheckOtpModel? checkOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCheckOtp,
      checkResponse: checkResponse,
    );

    if (response != null) {
      checkOtpModel = CheckOtpModel.fromJson(jsonDecode(response.body));
      return checkOtpModel;
    }
    return null;
  }

  ///Create New Password Api Calling.....
  static Future<CommonResponseModel?> newPasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CommonResponseModel? commonResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfResetPassword,
      checkResponse: checkResponse,
    );

    if (response != null) {
      commonResponseModel =
          CommonResponseModel.fromJson(jsonDecode(response.body));
      return commonResponseModel;
    }
    return null;
  }

  ///How to earn more points Api Calling.....
  static Future<HowToEarnPointsModel?> howToEarnPointsApi(
      {void Function(int)? checkResponse}) async {
    HowToEarnPointsModel? howToEarnPointsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetEarnMorePoint,
      checkResponse: checkResponse,
    );

    if (response != null) {
      howToEarnPointsModel =
          HowToEarnPointsModel.fromJson(jsonDecode(response.body));
      return howToEarnPointsModel;
    }
    return null;
  }

  ///Add Events Api Calling.....
  static Future<AddEventModel?> addEventsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    File? image,
  }) async {
    AddEventModel? addEventModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddEvent,
      imageKey: ApiKeyConstants.image,
      image: image,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addEventModel = AddEventModel.fromJson(jsonDecode(response.body));
      return addEventModel;
    }
    return null;
  }

  ///Edit Events Api Calling.....
  static Future<AddEventModel?> editEventsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddEventModel? addEventModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateEvent,
      wantSnackBar: false,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addEventModel = AddEventModel.fromJson(jsonDecode(response.body));
      return addEventModel;
    }
    return null;
  }

  /// Get event Api Calling .....
  static Future<GetEventsModel?> getEventApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    GetEventsModel? getEventsModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetEvent,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getEventsModel = GetEventsModel.fromJson(jsonDecode(response.body));
      return getEventsModel;
    }
    return null;
  }

  ///Update event status Api Calling.....
  static Future<GetEventsModel?> updateEventStatusApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetEventsModel? getEventsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      wantSnackBar: false,
      url: ApiUrlConstants.endPointOfEventActiveDeactivate,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getEventsModel = GetEventsModel.fromJson(jsonDecode(response.body));
      return getEventsModel;
    }
    return null;
  }

  ///Request List Api Calling.....
  static Future<AddRequestModel?> requestListApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddRequestModel? addRequestModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      wantSnackBar: false,
      url: ApiUrlConstants.endPointOfAddListRequest,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addRequestModel = AddRequestModel.fromJson(jsonDecode(response.body));
      return addRequestModel;
    }
    return null;
  }

  /// Get Request  Api Calling .....
  static Future<GetRequestModel?> getRequestApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    GetRequestModel? getRequestModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetEventClubRequest,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getRequestModel = GetRequestModel.fromJson(jsonDecode(response.body));
      return getRequestModel;
    }
    return null;
  }

  ///Get Club Request List Api Calling.....
  static Future<ClubRequestModel?> getClubRequestListApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ClubRequestModel? clubRequestModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      wantSnackBar: false,
      url: ApiUrlConstants.endPointOfClubRequestList,
      checkResponse: checkResponse,
    );

    if (response != null) {
      clubRequestModel = ClubRequestModel.fromJson(jsonDecode(response.body));
      return clubRequestModel;
    }
    return null;
  }

  ///Get Club Request List Api Calling.....
  static Future<AddRequestModel?> updateRequestStatusApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddRequestModel? addRequestModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAcceptCancelRequest,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addRequestModel = AddRequestModel.fromJson(jsonDecode(response.body));
      return addRequestModel;
    }
    return null;
  }

  /// Get Club Info   Api Calling .....
  static Future<ClubInfoModel?> getClubInfoApi({
    void Function(int)? checkResponse,
  }) async {
    ClubInfoModel? clubInfoModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetClubInfo,
      checkResponse: checkResponse,
    );
    if (response != null) {
      clubInfoModel = ClubInfoModel.fromJson(jsonDecode(response.body));
      return clubInfoModel;
    }
    return null;
  }

  ///Get all users list Api Calling.....
  static Future<AllUsersModel?> getAllUsersApi(
      {void Function(int)? checkResponse}) async {
    AllUsersModel? allUsersModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetAllUser,
      checkResponse: checkResponse,
    );

    if (response != null) {
      allUsersModel = AllUsersModel.fromJson(jsonDecode(response.body));
      return allUsersModel;
    }
    return null;
  }

  ///Submit Add Costomer Api Calling.....
  static Future<AddCostomerModel?> submitAddCostomerApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddCostomerModel? addCostomerModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfClubAddCostomerRequest,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addCostomerModel = AddCostomerModel.fromJson(jsonDecode(response.body));
      return addCostomerModel;
    }
    return null;
  }

  ///Get Clubs Consumer List Api Calling.....
  static Future<AllUsersModel?> getClubsConsumerListApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    AllUsersModel? allUsersModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetClubFriendList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      allUsersModel = AllUsersModel.fromJson(jsonDecode(response.body));
      return allUsersModel;
    }
    return null;
  }

  ///Add Hanger List Api Calling.....
  static Future<AddHangerModel?> addHangerListApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddHangerModel? addHangerModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddHanger,
      wantSnackBar: false,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addHangerModel = AddHangerModel.fromJson(jsonDecode(response.body));
      return addHangerModel;
    }
    return null;
  }

  /// Get Club Hanger Api Calling .....
  static Future<GetClubHangerModel?> getClubHangerApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    GetClubHangerModel? getClubHangerModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetClubHanger,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getClubHangerModel =
          GetClubHangerModel.fromJson(jsonDecode(response.body));
      return getClubHangerModel;
    }
    return null;
  }

  ///Hang Jacket Api Calling.....
  static Future<HangJacketModel?> hangJacketApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    HangJacketModel? hangJacketModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfHangJacket,
      checkResponse: checkResponse,
    );

    if (response != null) {
      hangJacketModel = HangJacketModel.fromJson(jsonDecode(response.body));
      return hangJacketModel;
    }
    return null;
  }

  ///Get Current Jacket Api Calling.....
  static Future<GetCurrentJacketModel?> getCurrentJacketApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    GetCurrentJacketModel? getCurrentJacketModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetCurrentJacket,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getCurrentJacketModel =
          GetCurrentJacketModel.fromJson(jsonDecode(response.body));
      return getCurrentJacketModel;
    }
    return null;
  }

  /// Get Wallet Amount According Club id Api Calling .....
  static Future<GetClubWalletModel?> getWalletAmountAccordingClubIdApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    GetClubWalletModel? getClubWalletModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetClubWallet,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getClubWalletModel =
          GetClubWalletModel.fromJson(jsonDecode(response.body));
      return getClubWalletModel;
    }
    return null;
  }

  ///Add PurchaseEvent Api Calling.....
  static Future<AddPurchaseEventModel?> addPurchaseEventApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddPurchaseEventModel? addPurchaseEventModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddPurchaseEvent,
      checkResponse: checkResponse,
    );

    if (response != null) {
      addPurchaseEventModel =
          AddPurchaseEventModel.fromJson(jsonDecode(response.body));
      return addPurchaseEventModel;
    }
    return null;
  }

  ///Get My Purchasing Events Api Calling.....
  static Future<GetMyPurchasingEventModel?> getMyPurchasingEventsApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    GetMyPurchasingEventModel? getMyPurchasingEventModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetPurchaseEvent,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getMyPurchasingEventModel =
          GetMyPurchasingEventModel.fromJson(jsonDecode(response.body));
      return getMyPurchasingEventModel;
    }
    return null;
  }

  ///Get Purchasing User List Api Calling.....
  static Future<GetMyPurchasingEventModel?> getPurchasedUserListApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    GetMyPurchasingEventModel? getMyPurchasingEventModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetPurchaseEventUser,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getMyPurchasingEventModel =
          GetMyPurchasingEventModel.fromJson(jsonDecode(response.body));
      return getMyPurchasingEventModel;
    }
    return null;
  }

  ///Scan Even Qr Code for get point Api Calling.....
  static Future<ScanEventQrModel?> scanEventQrCodeApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ScanEventQrModel? scanEventQrModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfScanEventQrCode,
      checkResponse: checkResponse,
    );

    if (response != null) {
      scanEventQrModel = ScanEventQrModel.fromJson(jsonDecode(response.body));
      return scanEventQrModel;
    }
    return null;
  }

  /// Remove current list by id....
  static Future<CommonResponseModel?> removeCurrentListUser(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    CommonResponseModel? commonResponseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfDeleteEventClubRequest,
      checkResponse: checkResponse,
    );

    if (response != null) {
      commonResponseModel =
          CommonResponseModel.fromJson(jsonDecode(response.body));
      return commonResponseModel;
    }
    return null;
  }

  /// Delete event ....
  static Future<CommonResponseModel?> deleteEventApi(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    CommonResponseModel? commonResponseModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfDeleteEvent,
      checkResponse: checkResponse,
    );
    if (response != null) {
      commonResponseModel =
          CommonResponseModel.fromJson(jsonDecode(response.body));
      return commonResponseModel;
    }
    return null;
  }

  ///PushNotification Api Calling.....
  static Future<CommonResponseModel?> pushNotification({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    CommonResponseModel? commonResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfNotifi,
      checkResponse: checkResponse,
    );

    if (response != null) {
      print('Response:-${response.body.toString()}');
      commonResponseModel =
          CommonResponseModel.fromJson(jsonDecode(response.body));
      return commonResponseModel;
    }
    return null;
  }

  /// Get My notification  by user_id....
  static Future<MyNotificationModel?> getNotificationByUserId(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> queryParameters}) async {
    MyNotificationModel? myNotificationModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetPushNotification,
      checkResponse: checkResponse,
    );

    if (response != null) {
      myNotificationModel =
          MyNotificationModel.fromJson(jsonDecode(response.body));
      return myNotificationModel;
    }
    return null;
  }
}
