import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/core/global_widget/custom_text.dart';

class EngineWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String temperature;

  const EngineWidget({
    required this.icon,
    required this.title,
    required this.temperature,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 105.h,
      margin: EdgeInsets.all(5.r),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[400]!, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: Colors.grey[600], size: 24.r),
          CustomTextView(
            title,
            fontSize: 14.sp,
            color: Color(0xFF636F85),
            fontWeight: FontWeight.bold,
          ),
          CustomTextView(
            temperature,
            fontSize: 16.sp,
            color: Color(0xFF2D2D2D),
          ),
        ],
      ),
    );
  }
}
