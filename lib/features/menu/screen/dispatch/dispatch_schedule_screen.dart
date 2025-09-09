import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/core/routes/app_route.dart';

import '../../../../core/utils/app_colors.dart';
import '../../controller/dispatch_schedule_controller.dart';
import '../../widget/trip_card.dart';

class DispatchScheduleScreen extends StatelessWidget {
  DispatchScheduleScreen({super.key});

  final DispatchScheduleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Dispatch & Scheduling",
          style: GoogleFonts.figtree(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.secondaryColor,
          ),
        ),
        actions: [
          Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.addTripScreen);
              },
              icon: Icon(Icons.add, color: Colors.white, size: 24.r),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: controller.selectedMonth.value,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        items: List.generate(
                          12,
                          (i) => DropdownMenuItem(
                            value: i + 1,
                            child: CustomTextView(
                              controller.months[i],
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onChanged: (m) =>
                            m == null ? null : controller.changeMonth(m),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: controller.selectedYear.value,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                        items: controller.years
                            .map(
                              (y) => DropdownMenuItem(
                                value: y,
                                child: Text(
                                  '$y',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (y) =>
                            y == null ? null : controller.changeYear(y),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 12.h),
              Obx(() {
                final days = controller.datesForCurrentMonth;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: days.map((d) {
                      final isSelected = _isSameDay(
                        d,
                        controller.selectedDate.value,
                      );
                      return GestureDetector(
                        onTap: () => controller.selectDay(d),
                        child: Container(
                          width: 80.w,
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 6.h),
                              Text(
                                controller.weekdayName(d),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              CustomTextView(
                                '${d.day}',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
              SizedBox(height: 12.h),
              CustomTextView(
                "Today (10 Trips)",
                color: const Color(0xFF2D2D2D),
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 12.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return TripCard(
                    startTime: "10:00 am",
                    endTime: "12:30 pm",
                    startLocation: "Thompson Rd, Indoor, USA",
                    endLocation: "Pinak Rd, Outdoor, USA",
                    distance: "240 km",
                    duration: "2h 30m",
                    status: "Completed",
                    onDetails: () {
                      Get.toNamed(AppRoute.tripDetailsScreen);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
