import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';
import 'package:mmets/core/global_widget/custom_button.dart';
import 'package:mmets/core/global_widget/custom_text.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Trip Details"),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomButton(
          onPressed: () {
            Get.back();
          },
          text: "Reschedule",
          textColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Map Preview
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 180.h,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: Center(
                    child: Image.network(
                      "https://static0.makeuseofimages.com/wordpress/wp-content/uploads/2022/07/route-marked-on-a-map.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Trip Info
              _buildInfoRow(
                Icons.location_on_outlined,
                "Start From",
                "Thompson Rd, Indoor, USA",
              ),
              _buildInfoRow(
                Icons.flag_outlined,
                "Destination",
                "Pinak Rd, Outdoor, USA",
              ),
              _buildInfoRow(Icons.access_time, "Start Time", "10:00 am"),
              _buildInfoRow(Icons.access_time, "End Time", "12:30 pm"),
              _buildInfoRow(Icons.near_me_outlined, "Total Distance", "240 km"),
              _buildInfoRow(Icons.timer_outlined, "Duration", "2h 30m"),
              _buildInfoRow(
                Icons.check_circle_outline,
                "Status",
                "Completed",
                valueColor: Colors.green,
              ),

              SizedBox(height: 20.h),

              // Trip Description
              CustomTextView(
                "Trip Description",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              CustomTextView(
                "Experience the magic of Spain’s coastline with our 5-day Sunset Escape. "
                "Starting in vibrant Barcelona, stroll through the historic Gothic Quarter, "
                "enjoy authentic tapas, and soak up the sun at Barceloneta Beach.",
                fontSize: 14.sp,
                color: Colors.grey.shade700,
                textAlign: TextAlign.justify,
                maxLines: 3,
              ),

              SizedBox(height: 80.h), // for button spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20.sp, color: Colors.grey),
          SizedBox(width: 12.w),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100.w,
                  child: CustomTextView(
                    label,
                    fontSize: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                Expanded(
                  child: CustomTextView(
                    value,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: valueColor ?? Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
