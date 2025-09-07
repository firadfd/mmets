import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/core/utils/app_colors.dart';

import '../../../core/utils/asset_path.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String imageUrl;
  final Function onCardClick;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
    required this.imageUrl,
    required this.onCardClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30.r, backgroundImage: NetworkImage(imageUrl)),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextView(
                  name,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                SizedBox(height: 4.h),
                CustomTextView(phone, fontSize: 14.sp, color: Colors.white70),
                CustomTextView(email, fontSize: 14.sp, color: Colors.white70),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: IconButton(
              icon: Image.asset(
                AssetPath.edit,
                color: Colors.white,
                height: 20.h,
                width: 20.w,
              ),
              onPressed: () {
                onCardClick();
              },
              padding: EdgeInsets.zero,
              iconSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
