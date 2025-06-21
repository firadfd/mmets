import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmets/core/global_widget/custom_button.dart';
import 'package:pinput/pinput.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/routes/app_route.dart';
import '../../../core/utils/app_colors.dart';
import '../controller/verify_otp_controller.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({super.key});

  final VerifyOtpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5FF),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primaryColor, width: 2),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Color(0xFFF5F5FF),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              CustomTextView(
                "Verify Email",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomTextView(
                  "Enter the verification code that we have \nsent to your email",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  color: Color(0xff2d2d2d),
                ),
              ),
              SizedBox(height: 20.h),
              Pinput(
                length: 4,
                controller: controller.otpController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                showCursor: true,
                onCompleted: (pin) {},
              ),
              SizedBox(height: 10.h),
              Obx(() {
                return RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
                    children: [
                      controller.isTimerRunning.value
                          ? TextSpan(
                        text: 'Resend Code in',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                          : TextSpan(
                        text: 'Don\'t receive the code ',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.resendCode,
                      ),
                      controller.isTimerRunning.value
                          ? TextSpan(
                        text: ' 0:${controller.secondsLeft.value.toString().padLeft(2, '0')}',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                          : TextSpan(
                        text: ' Resend Code',
                        style: GoogleFonts.poppins(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.resendCode,
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoute.allowLocationScreen);
                },
                text: "Verify",
                textColor: Colors.white,
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
