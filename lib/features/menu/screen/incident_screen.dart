import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/global_widget/custom_text.dart';
import '../../../core/routes/app_route.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/asset_path.dart';
import '../widget/custom_color_app_bar.dart';
import '../widget/incident_item.dart';

class IncidentScreen extends StatelessWidget {
  IncidentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomColorAppBar(title: "Incident & Accident Report"),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 180.h,
            child: Container(
              padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              color: AppColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: Container(
                  height: 120.h,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.teal[700],
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextView(
                              "Submit Report",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            SizedBox(height: 4.h),
                            CustomTextView(
                              "Are you facing any issues or incidents please let us know",
                              fontSize: 14.sp,
                              color: Colors.white70,
                            ),
                            SizedBox(height: 10.h),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoute.addFuelInfoScreen);
                              },
                              child: Container(
                                width: 148.h,
                                height: 40.h,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 6,
                                  children: [
                                    CustomTextView(
                                      'Submit Incidents',
                                      textAlign: TextAlign.center,
                                      color: const Color(0xFF0D9488),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    Container(
                                      width: 16.w,
                                      height: 16.h,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Stack(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Image.asset(AssetPath.frame, width: 80.w),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 160.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextView(
                            "All Submitted Reports",
                            color: const Color(0xFF2D2D2D),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return IncidentItem(
                              id: 'DM TA-11-5578',
                              type: 'Transit Van • Truck',
                              dateTime: '12 July 25 • 11:00 am',
                              desc:
                                  'Corem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
                              imageUrl:
                                  'https://live.staticflickr.com/33/52824625_f3596d1065_o.jpg',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
