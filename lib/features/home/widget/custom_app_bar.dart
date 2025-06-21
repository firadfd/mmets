import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/core/utils/asset_path.dart';

import '../../../core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Function onMessageClick;
  Function onIconClick;
  Function onEldClick;
  Function onNotificationClick;

  CustomAppBar({
    super.key,
    required this.onMessageClick,
    required this.onIconClick,
    required this.onEldClick,
    required this.onNotificationClick,
  });

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: Row(
        children: [
          GestureDetector(
            onTap:() {
              onIconClick();
            },
            child: Image.asset(
              AssetPath.iLogo,
              height: 40,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(width: 10.w),
          CustomTextView(
            "PrologELD",
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
          Spacer(),
          GestureDetector(
            onTap:(){onEldClick();},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: CustomTextView(
                'ELD',
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
          ),

          SizedBox(width: 16.w),
          GestureDetector(
            onTap:(){onMessageClick();},
            child: BuildIconWithDot(AssetPath.message),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap:(){onNotificationClick();},
            child: BuildIconWithDot(AssetPath.notification),
          ),
        ],
      ),
    );
  }

  Widget BuildIconWithDot(String icon) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: Color(0xFFF4F7FA),
          child: Image.asset(
            icon,
            color: Color(0xFF5C6574),
            width: 20.w,
            height: 20.h,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Color(0xFF00C9C0),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
