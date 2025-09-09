import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/features/menu/screen/driver/week_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../../controller/driver_behavior_controller.dart';
import 'day_screen.dart';
import 'month_screen.dart';

class DriverBehaviorScreen extends StatelessWidget {
  DriverBehaviorScreen({super.key});

  final DriverBehaviorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FA),
        centerTitle: true,
        title: CustomTextView(
          "Driver Behavior Monitoring",
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryColor,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: GetBuilder<DriverBehaviorController>(
            builder: (controller) => TabBar(
              controller: controller.tabController,
              unselectedLabelColor: Color(0xff6B6B6B),
              labelStyle: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
              labelColor: AppColors.primaryColor,
              indicatorColor: AppColors.primaryColor,
              onTap: (index) => controller.changeTab(index),
              tabs: const [
                Tab(text: "Day"),
                Tab(text: "Week"),
                Tab(text: "Month"),
              ],
            ),
          ),
        ),
      ),
      body: GetBuilder<DriverBehaviorController>(
        builder: (controller) => TabBarView(
          controller: controller.tabController,
          children: [DayScreen(), WeekScreen(), MonthScreen()],
        ),
      ),
    );
  }
}
