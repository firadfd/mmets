import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_password_field.dart';
import 'package:mmets/core/validation/password_validation.dart';
import '../../../core/global_widget/circular_progress_indicator.dart';
import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/global_widget/custom_textField.dart';
import '../../../core/routes/app_route.dart';
import '../../../core/validation/email_validation.dart';
import '../controller/create_new_pass_controller.dart';

class CreateNewPassScreen extends StatelessWidget {
  CreateNewPassScreen({super.key});
  final CreateNewPassController controller = Get.find();

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
                  "Create New Password",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2d2d2d),
                ),
                SizedBox(height: 10.h),
                CustomTextView(
                  "Your password must be different from previous used password",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff636F85),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextView(
                    "Password",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff636F85),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomPasswordField(
                  hints: "Enter Password",
                  validator: validatePassword,
                  prefixIcon: Icons.lock,
                  controller: controller.newPass,
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextView(
                    "Confirm Password",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff636F85),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomPasswordField(
                  hints: "Enter Confirm Password",
                  validator: validatePassword,
                  prefixIcon: Icons.lock,
                  controller: controller.conNewPass,
                ),
                SizedBox(height: 30.h),
                Obx(() {
                  if (controller.isLoading.value) {
                    return customCircularProgressIndicator();
                  }
                  return CustomButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoute.signInScreen);
                    },
                    text: "Save",
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
