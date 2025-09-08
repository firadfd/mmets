import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mmets/features/auth/screen/sign_in_screen.dart';
import 'package:mmets/features/auth/screen/sign_up_screen.dart';
import 'package:mmets/features/auth/screen/verify_otp_screen.dart';
import 'package:mmets/features/forgot_pass/screen/verify_forgot_otp_screen.dart';
import 'package:mmets/features/home/screen/message_screen.dart';
import 'package:mmets/features/home/screen/notification_screen.dart';
import 'package:mmets/features/main_view/screen/main_view_screen.dart';
import 'package:mmets/features/menu/screen/edit_profile_screen.dart';

import '../../features/auth/screen/allow_location_screen.dart';
import '../../features/forgot_pass/screen/create_new_pass_screen.dart';
import '../../features/forgot_pass/screen/forgot_pass_screen.dart';
import '../../features/fuel/screen/add_fuel_screen.dart';
import '../../features/home/screen/form_edit_screen.dart';
import '../../features/home/screen/log_preview_screen.dart';
import '../../features/menu/screen/driver_behavior_screen.dart';
import '../../features/menu/screen/privacy_policy_screen.dart';
import '../../features/menu/screen/setting_screen.dart';
import '../../features/menu/screen/terms_condition_screen.dart';
import '../../features/splash_screen/screen/splash_screen.dart';

class AppRoute {
  static String splashScreen = "/splashScreen";
  static String signInScreen = "/SignInScreen";
  static String signUpScreen = "/SignUpScreen";
  static String verifyOtpScreen = "/VerifyOtpScreen";
  static String allowLocationScreen = "/AllowLocationScreen";
  static String forgotPassScreen = "/ForgotPassScreen";
  static String verifyForgotOtpScreen = "/VerifyForgotOtpScreen";
  static String createNewPassScreen = "/CreateNewPassScreen";
  static String mainViewScreen = "/MainViewScreen";
  static String notificationScreen = "/NotificationScreen";
  static String messageScreen = "/MessageScreen";
  static String formEditScreen = "/FormEditScreen";
  static String logPreviewScreen = "/LogPreviewScreen";
  static String addFuelScreen = "/AddFuelScreen";
  static String editProfileScreen = "/EditProfileScreen";
  static String settingScreen = "/SettingScreen";
  static String termsConditionScreen = "/TermsConditionScreen";
  static String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static String driverBehaviorScreen = "/DriverBehaviorScreen";

  static List<GetPage> route = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signInScreen,
      page: () => SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: verifyOtpScreen,
      page: () => VerifyOtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: allowLocationScreen,
      page: () => AllowLocationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: forgotPassScreen,
      page: () => ForgotPassScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: verifyForgotOtpScreen,
      page: () => VerifyForgotOtpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: createNewPassScreen,
      page: () => CreateNewPassScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: mainViewScreen,
      page: () => MainViewScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: messageScreen,
      page: () => MessageScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: formEditScreen,
      page: () => FormEditScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: logPreviewScreen,
      page: () => LogPreviewScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: addFuelScreen,
      page: () => AddFuelScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: settingScreen,
      page: () => SettingScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: termsConditionScreen,
      page: () => TermsConditionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: driverBehaviorScreen,
      page: () => DriverBehaviorScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
