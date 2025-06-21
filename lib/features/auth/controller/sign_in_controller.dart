import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/helper/shared_prefarenses_helper.dart';

class SignInController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    await preferencesHelper.init();
    super.onInit();
  }

  Future<void> saveToken(String token) async {
    preferencesHelper.setString('userToken', token);
  }

}
