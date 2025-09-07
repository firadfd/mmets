import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/utils/app_colors.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_text.dart';

class SettingController extends GetxController {
  void showLogoutBottomSheet(VoidCallback onLogout) {
    showModalBottomSheet(
      context: Get.context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(Get.context!).viewInsets.bottom + 20.h,
            left: 20.w,
            right: 20.w,
            top: 30.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(),
              SizedBox(height: 30.h),
              CustomTextView(
                "Are You Sure?",
                color: const Color(0xFF171725),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 12.h),
              CustomTextView(
                "You’ll need to log in again to access your account.",
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
                    child: CustomButton(onPressed: onLogout, text: "Log Out"),
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

  Widget _buildIcon() {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor,
          ],
          radius: 0.8,
        ),
      ),
      alignment: Alignment.center,
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 24.r,
        child: Icon(Icons.help_outline, color: Colors.white, size: 28.r),
      ),
    );
  }
}
