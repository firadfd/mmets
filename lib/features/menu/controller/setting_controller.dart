import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/utils/app_colors.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_text.dart';

class SettingController extends GetxController {

  void showLogoutDialog(VoidCallback onLogout) {
    showDialog(
      context: Get.context!,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 30.h,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextView(
                "Logout",
                color: const Color(0xFF171725),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 12.h),
              CustomTextView(
                "Are you sure you want to log out?",
                color: const Color(0xFF636F85),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: Color(0xffe9f3fe),
                      text: "Cancel",
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: CustomButton(onPressed: onLogout, text: "Yes",textColor: Colors.white,),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }

}
