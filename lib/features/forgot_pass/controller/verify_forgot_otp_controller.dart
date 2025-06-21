import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyForgotOtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  RxInt secondsLeft = 30.obs;
  RxBool isTimerRunning = true.obs;
  Timer? _timer;
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    isTimerRunning.value = true;
    secondsLeft.value = 30;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value > 0) {
        secondsLeft.value--;
      } else {
        isTimerRunning.value = false;
        _timer?.cancel();
      }
    });
  }

  void resendCode() {
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
