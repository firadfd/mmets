import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global_widget/custom_appbar.dart';
import '../../../../core/global_widget/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: "Privacy Policy"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(child: Column(children: [
          SizedBox(height: 10.h),
          CustomTextView(
            "Your privacy is important to us. This policy outlines how we collect, use, and protect your information when using the Tattle App. We are committed to maintaining the security and confidentiality of your personal data.",
            color: const Color(0xFF636F85),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 25.h),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextView(
              "How We Use Your Information",
              color: const Color(0xFF2D2D2D),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextView(
            "We collect your Tattle data to help you track your progress and build better routines.\n\n We use analytics to personalize suggestions and improve your experience inside the app. \n\n If you sign up or contact us, we may collect your name and email address for account creation and communication.",
            color: const Color(0xFF636F85),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 25.h),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomTextView(
              "Contact Us",
              color: const Color(0xFF2D2D2D),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextView(
            "If you have any questions about this Privacy Policy, please contact us at:Email: support@tattle.app",
            color: const Color(0xFF636F85),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ])),
      ),);
  }
}
