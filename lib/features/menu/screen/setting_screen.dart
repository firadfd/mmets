import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';

import '../../../core/global_widget/custom_text.dart';
import '../../../core/routes/app_route.dart';
import '../controller/setting_controller.dart';
import '../widget/profile_item.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final SettingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                ProfileItem(
                  title: "Term of Service",
                  onClick: () {
                    Get.toNamed(AppRoute.termsConditionScreen);
                  },
                ),
                ProfileItem(
                  title: "Privacy Policy",
                  onClick: () {
                    Get.toNamed(AppRoute.privacyPolicyScreen);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Divider(color: Colors.grey, thickness: 1.h),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    controller.showLogoutDialog(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, size: 24.r, color: Color(0xFFFF4D4F)),
                      SizedBox(width: 10.w),
                      CustomTextView(
                        "Logout",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF4D4F),
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
