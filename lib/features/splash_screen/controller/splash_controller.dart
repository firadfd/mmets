import 'package:get/get.dart';
import '../../../core/helper/shared_prefarenses_helper.dart';
import '../../../core/routes/app_route.dart';

class SplashController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();

  @override
  Future<void> onInit() async {
    super.onInit();
    await preferencesHelper.init();
    _navigateToOnBoarding();
  }

  void _navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.signInScreen);
    });
  }
}
