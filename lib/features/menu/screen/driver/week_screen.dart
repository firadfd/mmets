import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/driver_behavior_controller.dart';
import '../../widget/behavior_summary.dart';
import '../../widget/custom_metric_item.dart';

class WeekScreen extends StatelessWidget {
  WeekScreen({super.key});

  final DriverBehaviorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  CustomMetricItem(),
                  SizedBox(height: 10.h),
                  BehaviorSummary(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
