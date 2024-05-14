import 'package:http/http.dart' as http;

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';

class ApiMethods {
  // static Future<UserModel?> userSignup({
  //   void Function(int)? checkResponse,
  //   Map<String, dynamic>? bodyParams,
  // }) async {
  //   UserModel? userModel;
  //   http.Response? response = await MyHttp.postMethod(
  //     bodyParams: bodyParams,
  //     url: ApiUrlConstants.endPointOfUserSignup,
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     userModel = UserModel.fromJson(jsonDecode(response.body));
  //     return userModel;
  //   }
  //   return null;
  // }

  static Future<http.Response?> userLikeUnlike({
    required Map<String, dynamic> queryParameters,
    void Function(int)? checkResponse,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: queryParameters,
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfUserLikeUnlike,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  /// Get Get Subscription List Model .....
  // static Future<GetSubscriptionModel?> getSubscriptionApi(
  //     {void Function(int)? checkResponse}) async {
  //   GetSubscriptionModel? subscriptionModel;
  //   http.Response? response = await MyHttp.getMethod(
  //     url: ApiUrlConstants.endPointOfGetSubscription,
  //     checkResponse: checkResponse,
  //   );
  //   if (response != null) {
  //     subscriptionModel =
  //         GetSubscriptionModel.fromJson(jsonDecode(response.body));
  //     return subscriptionModel;
  //   }
  //   return null;
  // }
}
