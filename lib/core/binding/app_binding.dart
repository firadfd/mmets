import 'package:get/get.dart';
import 'package:mmets/features/auth/controller/verify_otp_controller.dart';
import 'package:mmets/features/home/controller/home_controller.dart';
import '../../features/auth/controller/sign_in_controller.dart';
import '../../features/auth/controller/sign_up_controller.dart';
import '../../features/forgot_pass/controller/create_new_pass_controller.dart';
import '../../features/forgot_pass/controller/forgot_pass_controller.dart';
import '../../features/forgot_pass/controller/verify_forgot_otp_controller.dart';
import '../../features/main_view/controller/main_view_controller.dart';
import '../../features/splash_screen/controller/splash_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => VerifyOtpController(), fenix: true);
    Get.lazyPut(() => ForgotPassController(), fenix: true);
    Get.lazyPut(() => VerifyForgotOtpController(), fenix: true);
    Get.lazyPut(() => CreateNewPassController(), fenix: true);
    Get.lazyPut(() => MainViewController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
     }
}
