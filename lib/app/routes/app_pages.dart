import 'package:get/get.dart';

import '../modules/club_info/bindings/club_info_binding.dart';
import '../modules/club_info/views/club_info_view.dart';
import '../modules/event_wallet_history/bindings/event_wallet_history_binding.dart';
import '../modules/event_wallet_history/views/event_wallet_history_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_type/bindings/login_type_binding.dart';
import '../modules/login_type/views/login_type_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/provider_consumer_register/bindings/provider_consumer_register_binding.dart';
import '../modules/provider_consumer_register/views/provider_consumer_register_view.dart';
import '../modules/provider_event_detail/bindings/provider_event_detail_binding.dart';
import '../modules/provider_event_detail/views/provider_event_detail_view.dart';
import '../modules/provider_nav_bar/bindings/provider_nav_bar_binding.dart';
import '../modules/provider_nav_bar/views/provider_nav_bar_view.dart';
import '../modules/provider_publish_event/bindings/provider_publish_event_binding.dart';
import '../modules/provider_publish_event/views/provider_publish_event_view.dart';
import '../modules/request_list_history/bindings/request_list_history_binding.dart';
import '../modules/request_list_history/views/request_list_history_view.dart';
import '../modules/screens/bluecrown_point_view.dart';
import '../modules/screens/change_password_view.dart';
import '../modules/screens/club_events_view.dart';
import '../modules/screens/event_detail_view.dart';
import '../modules/screens/history_view.dart';
import '../modules/screens/home_view.dart';
import '../modules/screens/list_request_view.dart';
import '../modules/screens/logout_view.dart';
import '../modules/screens/my_profile_view.dart';
import '../modules/screens/new_password_view.dart';
import '../modules/screens/notification_setting_view.dart';
import '../modules/screens/password_reset_screen.dart';
import '../modules/screens/signup_view.dart';
import '../modules/screens/table_request_view.dart';
import '../modules/screens/terms_condition_view.dart';
import '../modules/screens/use_point_view.dart';
import '../modules/screens/wardrobe_availability_view.dart';
import '../modules/screens/wardrobe_scanner_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/wardrobe/bindings/wardrobe_binding.dart';
import '../modules/wardrobe/views/wardrobe_view.dart';

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
      page: () => const SignUpView(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () => const PasswordResetView(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const NewPasswordView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => const EventDetailView(),
    ),
    GetPage(
      name: _Paths.LIST_REQUEST,
      page: () => const ListRequestView(),
    ),
    GetPage(
      name: _Paths.TABLE_REQUEST,
      page: () => const TableRequestView(),
    ),
    GetPage(
      name: _Paths.USE_POINTS,
      page: () => const UsePointView(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
    ),
    GetPage(
      name: _Paths.WARDROBE_AVAILABILITY,
      page: () => const WardrobeAvailabilityView(),
    ),
    GetPage(
      name: _Paths.WARDROBE_SCANNER,
      page: () => const WardrobeScannerView(),
    ),
    GetPage(
      name: _Paths.BLUECROWN_POINT,
      page: () => const BlueCrownPointView(),
    ),
    GetPage(
      name: _Paths.CLUB_EVENTS,
      page: () => const ClubEventView(),
    ),
    GetPage(
      name: _Paths.CLUB_INFO,
      page: () => const ClubInfoView(),
      binding: ClubInfoBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LogoutView(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SETTING,
      page: () => const NotificationSettingView(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITION,
      page: () => const TermsConditionView(),
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
  ];
}
