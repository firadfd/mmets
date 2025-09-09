import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/core/utils/asset_path.dart';

class MaintenanceItem extends StatelessWidget {
  final String id;
  final String type;
  final String dateTime;
  final String price;

  const MaintenanceItem({
    required this.id,
    required this.type,
    required this.dateTime,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0.r),
        border: Border.all(color: Colors.grey[400]!, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(AssetPath.truck, width: 24.w, height: 24.h),
              SizedBox(width: 12.0.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextView(
                    id,
                    fontSize: 14.sp,
                    color: Color(0xFF2D2D2D),
                    fontWeight: FontWeight.w600,
                  ),
                  CustomTextView(
                    type,
                    fontSize: 14.sp,
                    color: Color(0xFF2D2D2D),
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextView(
                    dateTime,
                    fontSize: 12.sp,
                    color: Color(0xFF636F85),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
          CustomTextView(
            price,
            fontSize: 16.sp,
            color: Color(0xFF2D2D2D),
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
