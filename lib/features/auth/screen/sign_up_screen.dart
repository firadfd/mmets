import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmets/core/global_widget/custom_button.dart';
import 'package:mmets/core/utils/asset_path.dart';
import '../../../../core/validation/email_validation.dart';
import '../../../../core/validation/name_validator.dart';
import '../../../../core/validation/password_validation.dart';
import '../../../core/global_widget/circular_progress_indicator.dart';
import '../../../core/global_widget/custom_password_field.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/global_widget/custom_textField.dart';
import '../../../core/routes/app_route.dart';
import '../../../core/utils/app_colors.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
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
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextView(
                  "Create Account To PrologELD",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2d2d2d),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextView(
                    "Full Name",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff636F85),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: "Enter Full Name",
                  validator: validateName,
                  prefixIcon: Icons.person_2_outlined,
                  keyboardType: TextInputType.text,
                  controller: controller.nameController,
                ),
                SizedBox(height: 15.h),
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
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextView(
                    "Contact Number",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff636F85),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: "+99   Enter Contact Number",
                  validator: validateEmail,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextView(
                    "Driving License",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff636F85),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  hintText: "Ender Deriving License",
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
                  hints: "Enter Password",
                  validator: validatePassword,
                  prefixIcon: Icons.lock_outline,
                  controller: controller.passwordController,
                ),
                SizedBox(height: 20.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.isChecked.value,
                        checkColor: AppColors.white,
                        activeColor: AppColors.primaryColor,
                        onChanged: (value) {
                          controller.isChecked.value = value ?? false;
                        },
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          children: [
                            TextSpan(
                              text: "I agree to FileflowAI ",
                              style: GoogleFonts.figtree(
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                              text: "Terms of Service",
                              style: GoogleFonts.figtree(
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.snackbar(
                                    "Link",
                                    "Terms of Service tapped",
                                  );
                                },
                            ),
                            TextSpan(text: " & "),
                            TextSpan(
                              text: "Privacy policy",
                              style: GoogleFonts.figtree(
                                color: Colors.blue,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.snackbar("Link", "Privacy Policy tapped");
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Obx(() {
                  if (controller.isLoading.value) {
                    return customCircularProgressIndicator();
                  }
                  return CustomButton(onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                      Get.toNamed(AppRoute.verifyOtpScreen);
                    // }

                  }, text: "Sign Up",textColor: Colors.white);
                }),
                SizedBox(height: 50.h),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.figtree(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoute.signInScreen);
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
