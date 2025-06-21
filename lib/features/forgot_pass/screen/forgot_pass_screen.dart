import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/global_widget/circular_progress_indicator.dart';
import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/global_widget/custom_textField.dart';
import '../../../core/routes/app_route.dart';
import '../../../core/validation/email_validation.dart';
import '../controller/forgot_pass_controller.dart';

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});
  final ForgotPassController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextView(
                "Forgot Password",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff2d2d2d),
              ),
              SizedBox(height: 10.h),
              CustomTextView(
                "Enter your email, we will send a verification \ncode to your email",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff636F85),
              ),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextView(
                  "Email Address",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff636F85),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                hintText: "Enter Email Address",
                validator: validateEmail,
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
              ),
              SizedBox(height: 30.h),
              Obx(() {
                if (controller.isLoading.value) {
                  return customCircularProgressIndicator();
                }
                return CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.verifyForgotOtpScreen);
                  },
                  text: "Send Code",
                  textColor: Colors.white,
                );
              }),
            ],
          ),
        ),
      )
    );
  }
}
