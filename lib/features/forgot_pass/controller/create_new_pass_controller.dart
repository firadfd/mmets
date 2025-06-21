
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/helper/shared_prefarenses_helper.dart';

class CreateNewPassController extends GetxController {
  SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();
  TextEditingController newPass = TextEditingController();
  TextEditingController conNewPass = TextEditingController();
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
