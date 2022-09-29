import 'package:get/get.dart';
import 'package:royalty_nurse/Splash/Screens/splash_screen.dart';
import 'package:royalty_nurse/auth_module/Screens/login.dart';
import 'package:royalty_nurse/auth_module/Screens/otp_verification.dart';
import 'package:royalty_nurse/auth_module/Screens/prelogin.dart';
import 'package:royalty_nurse/auth_module/Screens/signup.dart';
import 'package:royalty_nurse/bottom_navigation_bar/Screens/bottom_navigation_bar.dart';
import 'package:royalty_nurse/covid_preferencess/Screens/covid_prefrence.dart';
import 'package:royalty_nurse/documents_module/Screens/documents_required_additional.dart';
import 'package:royalty_nurse/documents_module/Screens/UploadDocumentsScreen.dart';
import 'package:royalty_nurse/shift_module/Screens/filters_page.dart';
import 'package:royalty_nurse/notification_module/Screens/notification_page.dart';
import 'package:royalty_nurse/notification_module/Screens/notification_setting.dart';
import 'package:royalty_nurse/password_module/Screens/change_password.dart';
import 'package:royalty_nurse/password_module/Screens/forgot_password.dart';
import 'package:royalty_nurse/password_module/Screens/reset_password.dart';
import 'package:royalty_nurse/payment_method_module/Screens/payment_method.dart';
import 'package:royalty_nurse/payment_method_module/Screens/payment_settings.dart';
import 'package:royalty_nurse/profile_module/Screens/edit_profile.dart';
import 'package:royalty_nurse/profile_module/Screens/profile_page.dart';
import 'package:royalty_nurse/profile_module/Screens/profile_setup.dart';
import 'package:royalty_nurse/rating_reviews/Screens/ratings_reviews.dart';
import 'package:royalty_nurse/shift_module/Screens/find_screen.dart';
import 'package:royalty_nurse/shift_module/Screens/my_shift.dart';
import 'package:royalty_nurse/shift_module/Screens/shift_clock.dart';
import 'package:royalty_nurse/shift_module/Screens/shift_details.dart';
import 'package:royalty_nurse/terms_policy/Screens/privacy_policy.dart';
import 'package:royalty_nurse/terms_policy/Screens/terms_condition.dart';
import 'package:royalty_nurse/timesheet_module/Screens/time_sheet.dart';

part 'package:royalty_nurse/utils/Routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Paths.SPLASH_SCREEN_ROUTE,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Paths.PRE_LOGIN_SCREEN_ROUTE,
      page: () => PreLogin(),
    ),
    GetPage(
      name: Paths.LOGIN_SCREEN_ROUTE,
      page: () => LogIn(),
    ),
    GetPage(
      name: Paths.SIGNUP_SCREEN_ROUTE,
      page: () => SignUp(),
    ),
    GetPage(
      name: Paths.FORGOT_PASSWORD__SCREEN_ROUTE,
      page: () => ForgotPassword(),
    ),
    GetPage(
      name: Paths.OTP_VERIFICATION_SCREEN_ROUTE,
      page: () => OTPVerification(),
    ),
    GetPage(
      name: Paths.RESET_PASSWORD_SCREEN_ROUTE,
      page: () => resetPassword(),
    ),
    GetPage(
      name: Paths.CHANGE_PASSWORD_SCREEN_ROUTE,
      page: () => ChangePassword(),
    ),
    GetPage(
      name: Paths.TERMS_CONDITION_SCREEN_ROUTE,
      page: () => TermsCondition(),
    ),
    GetPage(
      name: Paths.PRIVACY_POLICY_SCREEN_ROUTE,
      page: () => PrivacyPolicy(),
    ),
    GetPage(
      name: Paths.PROFILE_SETUP_SCREEN_ROUTE,
      page: () => ProfileSetup(),
    ),
    GetPage(
      name: Paths.DOCUMENTS_SCREEN_ROUTE,
      page: () => DocumentsRequiredAdditional(),
    ),
    GetPage(
      name: Paths.UPLOAD_DOCUMENTS_SCREEN_ROUTE,
      page: () => UploadDocumentsScreen(),
    ),
    GetPage(
      name: Paths.FIND_SCREEN_ROUTE,
      page: () => FindScreen(),
    ),
    GetPage(
      name: Paths.EDIT_PROFILE_SCREEN_ROUTE,
      page: () => EditProfile(),
    ),
    GetPage(
      name: Paths.PAYMENT_METHOD_SCREEN_ROUTE,
      page: () => PaymentMethod(),
    ),
    GetPage(
      name: Paths.SHIFT_DETAILS_SCREEN_ROUTE,
      page: () => ShiftDetails(),
    ),
    GetPage(
      name: Paths.NOTIFICATION_SETTING_SCREEN_ROUTE,
      page: () => NotificationSetting(),
    ),
    GetPage(
      name: Paths.COVID_PREFERENCES_SCREEN_ROUTE,
      page: () => CovidPrefrences(),
    ),
    GetPage(
      name: Paths.PAYMENT_SETTINGS_SCREEN_ROUTE,
      page: () => PaymentSettings(),
    ),
    GetPage(
      name: Paths.TIME_SHEET_SCREEN_ROUTE,
      page: () => TimeSheet(),
    ),
    GetPage(
      name: Paths.RATING_REVIEWS_SCREEN_ROUTE,
      page: () => RatingsReviews(),
    ),
    GetPage(
      name: Paths.NOTIFICATION_PAGE_SCREEN_ROUTE,
      page: () => NotificationPage(),
    ),
    GetPage(
      name: Paths.FILTERS_SCREEN_ROUTE,
      page: () => FiltersPage(),
    ),
    GetPage(
      name: Paths.PROFILE_PAGE_SCREEN_ROUTE,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Paths.MY_SHIFT_SCREEN_ROUTE,
      page: () => MyShift(),
    ),
    GetPage(
      name: Paths.SHIFT_CLOCK_SCREEN_ROUTE,
      page: () => ShiftClock(),
    ),
    GetPage(
      name: Paths.BOTTOM_NAVIGATION_SCREEN_ROUTE,
      page: () => BottomNavBar(),
    ),
  ];
}
