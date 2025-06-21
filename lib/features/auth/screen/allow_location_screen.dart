import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/routes/app_route.dart';
import '../../../core/utils/asset_path.dart';

class AllowLocationScreen extends StatelessWidget {
  const AllowLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Image.asset(AssetPath.location, width: 300.w, height: 300.h),
                SizedBox(height: 20.h),
                CustomTextView(
                  "Allow Location Access for PrologELD",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  color: Color(0xff2d2d2d),
                ),
                SizedBox(height: 20.h),
                CustomTextView(
                  "To ensure accurate logging of driving hours and stay compliant with regulations, PrologELD requires access to your location.",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  color: Color(0xff636F85),
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoute.mainViewScreen);
                  },
                  text: "Allow Location Access",
                  textColor: Colors.white,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoute.mainViewScreen);
                  },
                  text: "Skip for now",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  borderColor: Colors.grey.shade700,
                  backgroundColor: Colors.white,
                  textColor: Colors.grey.shade700,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
