import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mmets/features/auth/screen/sign_in_screen.dart';
import 'package:mmets/features/auth/screen/sign_up_screen.dart';
import 'package:mmets/features/auth/screen/verify_otp_screen.dart';
import 'package:mmets/features/forgot_pass/screen/verify_forgot_otp_screen.dart';
import '../../features/auth/screen/allow_location_screen.dart';
import '../../features/forgot_pass/screen/create_new_pass_screen.dart';
import '../../features/forgot_pass/screen/forgot_pass_screen.dart';
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

  ];
}
