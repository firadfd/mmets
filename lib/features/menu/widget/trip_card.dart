import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/global_widget/custom_text.dart';

class TripCard extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String startLocation;
  final String endLocation;
  final String distance;
  final String duration;
  final String status;
  final VoidCallback onDetails;

  const TripCard({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.startLocation,
    required this.endLocation,
    required this.distance,
    required this.duration,
    required this.status,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.w),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 18.sp, color: Colors.grey),
                      SizedBox(width: 6.w),
                      CustomTextView(
                        "$startTime  →  $endTime",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 18.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: CustomTextView(
                          startLocation,
                          fontSize: 13.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.flag_outlined,
                        size: 18.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: CustomTextView(
                          endLocation,
                          fontSize: 13.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        Icons.near_me_outlined,
                        size: 18.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: CustomTextView(
                          distance,
                          fontSize: 13.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.timer_outlined,
                        size: 18.sp,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: CustomTextView(
                          duration,
                          fontSize: 13.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.h,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: status == "Completed"
                              ? Colors.teal.shade50
                              : Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: status == "Completed"
                                ? Colors.teal
                                : Colors.orange,
                          ),
                        ),
                        child: CustomTextView(
                          status,
                          fontSize: 13.sp,
                          color: status == "Completed"
                              ? Colors.teal
                              : Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      GestureDetector(
                        onTap: onDetails,
                        child: CustomTextView(
                          "Details >",
                          fontSize: 14.sp,
                          color: Colors.teal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: 70.w,
                height: 100.h,
                color: Colors.grey.shade200,
                child: Center(
                  child: Icon(Icons.map, color: Colors.grey, size: 40.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
