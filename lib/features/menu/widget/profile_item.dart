import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/global_widget/custom_text.dart';

class ProfileItem extends StatelessWidget {
  final Color? color;
  final String title;
  final VoidCallback onClick;

  ProfileItem({
    Key? key,
    required this.title,
    this.color,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            CustomTextView(
              title,
              fontWeight: FontWeight.w400,
              color: color.isNull ? Color(0xff2D2D2D) : color,
              fontSize: 16.sp,
            ),
            Spacer(),
            Icon(Icons.navigate_next, size: 24.r, color: Color(0xff2D2D2D)),
          ],
        ),
      ),
    );
  }
}
