import 'package:get/get.dart';

import '../modules/bluecrown_point/bindings/bluecrown_point_binding.dart';
import '../modules/bluecrown_point/views/bluecrown_point_view.dart';
import '../modules/club_events/bindings/club_events_binding.dart';
import '../modules/club_events/views/club_events_view.dart';
import '../modules/club_info/bindings/club_info_binding.dart';
import '../modules/club_info/views/club_info_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/event_detail/bindings/event_detail_binding.dart';
import '../modules/event_detail/views/event_detail_view.dart';
import '../modules/event_wallet_history/bindings/event_wallet_history_binding.dart';
import '../modules/event_wallet_history/views/event_wallet_history_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/how_get_point/bindings/how_get_point_binding.dart';
import '../modules/how_get_point/views/how_get_point_view.dart';
import '../modules/list_request/bindings/list_request_binding.dart';
import '../modules/list_request/views/list_request_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_type/bindings/login_type_binding.dart';
import '../modules/login_type/views/login_type_view.dart';
import '../modules/logout/bindings/logout_binding.dart';
import '../modules/logout/views/logout_view.dart';
import '../modules/my_profile/bindings/my_profile_binding.dart';
import '../modules/my_profile/views/my_profile_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/new_password/bindings/new_password_binding.dart';
import '../modules/new_password/views/new_password_view.dart';
import '../modules/notification_setting/bindings/notification_setting_binding.dart';
import '../modules/notification_setting/views/notification_setting_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/password_reset/bindings/password_reset_binding.dart';
import '../modules/password_reset/views/password_reset_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/provider_add_list/bindings/provider_add_list_binding.dart';
import '../modules/provider_add_list/views/provider_add_list_view.dart';
import '../modules/provider_all_event/bindings/provider_all_event_binding.dart';
import '../modules/provider_all_event/views/provider_all_event_view.dart';
import '../modules/provider_consumer_list/bindings/provider_consumer_list_binding.dart';
import '../modules/provider_consumer_list/views/provider_consumer_list_view.dart';
import '../modules/provider_consumer_register/bindings/provider_consumer_register_binding.dart';
import '../modules/provider_consumer_register/views/provider_consumer_register_view.dart';
import '../modules/provider_contact_us/bindings/provider_contact_us_binding.dart';
import '../modules/provider_contact_us/views/provider_contact_us_view.dart';
import '../modules/provider_create_qr_code/bindings/provider_create_qr_code_binding.dart';
import '../modules/provider_create_qr_code/views/provider_create_qr_code_view.dart';
import '../modules/provider_current_list/bindings/provider_current_list_binding.dart';
import '../modules/provider_current_list/views/provider_current_list_view.dart';
import '../modules/provider_download_qr_code/bindings/provider_download_qr_code_binding.dart';
import '../modules/provider_download_qr_code/views/provider_download_qr_code_view.dart';
import '../modules/provider_edit_event/bindings/provider_edit_event_binding.dart';
import '../modules/provider_edit_event/views/provider_edit_event_view.dart';
import '../modules/provider_event_detail/bindings/provider_event_detail_binding.dart';
import '../modules/provider_event_detail/views/provider_event_detail_view.dart';
import '../modules/provider_list_history/bindings/provider_list_history_binding.dart';
import '../modules/provider_list_history/views/provider_list_history_view.dart';
import '../modules/provider_nav_bar/bindings/provider_nav_bar_binding.dart';
import '../modules/provider_nav_bar/views/provider_nav_bar_view.dart';
import '../modules/provider_publish_event/bindings/provider_publish_event_binding.dart';
import '../modules/provider_publish_event/views/provider_publish_event_view.dart';
import '../modules/provider_purchased_users/bindings/provider_purchased_users_binding.dart';
import '../modules/provider_purchased_users/views/provider_purchased_users_view.dart';
import '../modules/provider_push_notification/bindings/provider_push_notification_binding.dart';
import '../modules/provider_push_notification/views/provider_push_notification_view.dart';
import '../modules/provider_wardrobe/bindings/provider_wardrobe_binding.dart';
import '../modules/provider_wardrobe/views/provider_wardrobe_view.dart';
import '../modules/request_list_history/bindings/request_list_history_binding.dart';
import '../modules/request_list_history/views/request_list_history_view.dart';
import '../modules/scanner_second/bindings/scanner_second_binding.dart';
import '../modules/scanner_second/views/scanner_second_view.dart';
import '../modules/screens/change_password_view.dart';
import '../modules/screens/wardrobe_availability_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/table_request/bindings/table_request_binding.dart';
import '../modules/table_request/views/table_request_view.dart';
import '../modules/terms_condition/bindings/terms_condition_binding.dart';
import '../modules/terms_condition/views/terms_condition_view.dart';
import '../modules/use_points/bindings/use_points_binding.dart';
import '../modules/use_points/views/use_points_view.dart';
import '../modules/wardrobe/bindings/wardrobe_binding.dart';
import '../modules/wardrobe/views/wardrobe_view.dart';
import '../modules/wardrobe_scanner/bindings/wardrobe_scanner_binding.dart';
import '../modules/wardrobe_scanner/views/wardrobe_scanner_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_TYPE,
      page: () => const LoginTypeView(),
      binding: LoginTypeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () => const PasswordResetView(),
      binding: PasswordResetBinding(),
    ),
    GetPage(
        name: _Paths.CREATE_NEW_PASSWORD,
        page: () => const NewPasswordView(),
        binding: NewPasswordBinding()),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => const EventDetailView(),
      binding: EventDetailBinding(),
    ),
    GetPage(
      name: _Paths.LIST_REQUEST,
      page: () => const ListRequestView(),
      binding: ListRequestBinding(),
    ),
    GetPage(
      name: _Paths.TABLE_REQUEST,
      page: () => const TableRequestView(),
      binding: TableRequestBinding(),
    ),
    GetPage(
      name: _Paths.USE_POINTS,
      page: () => const UsePointsView(),
      binding: UsePointsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.WARDROBE_AVAILABILITY,
      page: () => const WardrobeAvailabilityView(),
    ),
    GetPage(
      name: _Paths.WARDROBE_SCANNER,
      page: () => const WardrobeScannerView(),
      binding: WardrobeScannerBinding(),
    ),
    GetPage(
      name: _Paths.BLUECROWN_POINT,
      page: () => const BluecrownPointView(),
      binding: BluecrownPointBinding(),
    ),
    GetPage(
      name: _Paths.CLUB_EVENTS,
      page: () => const ClubEventsView(),
      binding: ClubEventsBinding(),
    ),
    GetPage(
      name: _Paths.CLUB_INFO,
      page: () => const ClubInfoView(),
      binding: ClubInfoBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LogoutView(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SETTING,
      page: () => const NotificationSettingView(),
      binding: NotificationSettingBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITION,
      page: () => const TermsConditionView(),
      binding: TermsConditionBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_WALLET_HISTORY,
      page: () => const EventWalletHistoryView(),
      binding: EventWalletHistoryBinding(),
    ),
    GetPage(
      name: _Paths.WARDROBE,
      page: () => const WardrobeView(),
      binding: WardrobeBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST_LIST_HISTORY,
      page: () => const RequestListHistoryView(),
      binding: RequestListHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_NAV_BAR,
      page: () => const ProviderNavBarView(),
      binding: ProviderNavBarBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_EVENT_DETAIL,
      page: () => const ProviderEventDetailView(),
      binding: ProviderEventDetailBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_CONSUMER_REGISTER,
      page: () => const ProviderConsumerRegisterView(),
      binding: ProviderConsumerRegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_PUBLISH_EVENT,
      page: () => const ProviderPublishEventView(),
      binding: ProviderPublishEventBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_WARDROBE,
      page: () => const ProviderWardrobeView(),
      binding: ProviderWardrobeBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_CREATE_QR_CODE,
      page: () => const ProviderCreateQrCodeView(),
      binding: ProviderCreateQrCodeBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_DOWNLOAD_QR_CODE,
      page: () => const ProviderDownloadQrCodeView(),
      binding: ProviderDownloadQrCodeBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_CONTACT_US,
      page: () => const ProviderContactUsView(),
      binding: ProviderContactUsBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_LIST_HISTORY,
      page: () => const ProviderListHistoryView(),
      binding: ProviderListHistoryBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_CURRENT_LIST,
      page: () => const ProviderCurrentListView(),
      binding: ProviderCurrentListBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_ADD_LIST,
      page: () => const ProviderAddListView(),
      binding: ProviderAddListBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_ALL_EVENT,
      page: () => const ProviderAllEventView(),
      binding: ProviderAllEventBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_EDIT_EVENT,
      page: () => const ProviderEditEventView(),
      binding: ProviderEditEventBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_PUSH_NOTIFICATION,
      page: () => const ProviderPushNotificationView(),
      binding: ProviderPushNotificationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.HOW_GET_POINT,
      page: () => const HowGetPointView(),
      binding: HowGetPointBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_CONSUMER_LIST,
      page: () => const ProviderConsumerListView(),
      binding: ProviderConsumerListBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_PURCHASED_USERS,
      page: () => const ProviderPurchasedUsersView(),
      binding: ProviderPurchasedUsersBinding(),
    ),
    GetPage(
      name: _Paths.SCANNER_SECOND,
      page: () => const ScannerSecondView(),
      binding: ScannerSecondBinding(),
    ),
  ];
}
