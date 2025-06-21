import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmets/core/global_widget/custom_button.dart';
import 'package:mmets/core/utils/app_colors.dart';
import '../../../core/global_widget/circular_progress_indicator.dart';
import '../../../core/global_widget/custom_password_field.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/global_widget/custom_textField.dart';
import '../../../core/routes/app_route.dart';
import '../../../core/utils/asset_path.dart';
import '../../../core/validation/email_validation.dart';
import '../../../core/validation/password_validation.dart';
import '../controller/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final SignInController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 60.h),
                Container(
                  width: 160.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetPath.logo),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextView(
                  "Log In To PrologELD",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2d2d2d),
                ),

                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextView(
                    "Username",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff636F85),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: "Enter username",
                  validator: validateEmail,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                ),
                SizedBox(height: 15.h),
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
                  hints: "Enter your Password",
                  validator: validatePassword,
                  prefixIcon: Icons.lock_outline,
                  controller: controller.passwordController,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoute.forgotPassScreen);
                    },
                    child: CustomTextView(
                      "Forgot password?",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Obx(() {
                  if (controller.isLoading.value) {
                    return customCircularProgressIndicator();
                  }
                  return CustomButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.verifyOtpScreen);
                    },
                    text: "Log in",
                    textColor: Colors.white,
                  );
                }),
                SizedBox(height: 50.h),
                RichText(
                  text: TextSpan(
                    text: 'Don’t have an account? ',
                    style: GoogleFonts.figtree(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.figtree(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoute.signUpScreen);
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
