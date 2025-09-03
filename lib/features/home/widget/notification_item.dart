import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/core/global_widget/custom_text.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String date;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final bool isRead;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.date,
    this.icon = Icons.alarm,
    this.iconBgColor = const Color(0xFFFFF5E5),
    this.iconColor = Colors.red,
    this.isRead = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.symmetric(vertical: 6.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextView(
                  title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                CustomTextView(
                  subtitle,
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                ),
                SizedBox(height: 8.h),
                CustomTextView(
                  "$time  $date",
                    fontSize: 12.sp,
                    color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
          if (isRead)
            Container(
              margin: const EdgeInsets.only(left: 8, top: 4),
              width: 10.w,
              height: 10.h,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
