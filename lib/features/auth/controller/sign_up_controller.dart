import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/helper/shared_prefarenses_helper.dart';

class SignUpController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await preferencesHelper.init();
  }


}
