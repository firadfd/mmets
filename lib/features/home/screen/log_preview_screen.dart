import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';
import 'package:mmets/core/global_widget/custom_text.dart';

import '../controller/home_controller.dart';
import '../widget/step_chart.dart';

class LogPreviewScreen extends StatelessWidget {
  LogPreviewScreen({super.key});

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      appBar: CustomAppBar(title: "Forms Edit"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CustomTextView(
                  "November 2025",
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
                SizedBox(height: 30.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextView(
                            "Logs",
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            color: const Color(0xff2D2D2D),
                          ),
                          Obx(
                            () => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 3.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(3.r),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: controller.selectedPeriod.value,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 18.r,
                                  ),
                                  items:
                                      [
                                        'Today',
                                        'Yesterday',
                                        'This Week',
                                        'This Month',
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        );
                                      }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      controller.selectPeriod(newValue);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 120.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: StateStepChart(
                            values: [
                              0,
                              0,
                              0,
                              0,
                              1,
                              1,
                              2,
                              2,
                              2,
                              1,
                              0,
                              0,
                              3,
                              3,
                              3,
                            ],
                            xLabels: [
                              "M1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6",
                              "7",
                              "8",
                              "9",
                              "10",
                              "11",
                              "N1",
                              "2",
                              "3",
                              "4",
                              "5",
                              "6",
                            ],
                            cellWidth: 40,
                            cellHeight: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
