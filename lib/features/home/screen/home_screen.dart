import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/core/routes/app_route.dart';
import 'package:mmets/core/utils/asset_path.dart';
import 'package:mmets/features/home/widget/custom_app_bar.dart';
import '../controller/home_controller.dart';
import '../widget/circular_status_widget.dart';
import '../widget/log_timeline_painter.dart';
import '../widget/step_chart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find();

  final Map<String, String> statusIcons = {
    'Off Duty': AssetPath.offDuty,
    'Sleeping': AssetPath.sleeping,
    'On Duty': AssetPath.onDuty,
    'Driving': AssetPath.driving,
  };

  final Map<String, double> sampleProgress = {
    'Break': 0.2,
    'Sleep': 0.3,
    'On Duty': 0.4,
    'Driving': 0.25,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      appBar: CustomAppBar(
        onIconClick: () {
          print('Icon Clicked');
        },
        onEldClick: () {
          print('ELD Clicked');
        },
        onMessageClick: () {
          Get.toNamed(AppRoute.messageScreen);
        },
        onNotificationClick: () {
          Get.toNamed(AppRoute.notificationScreen);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatusButton('Off Duty'),
                    _buildStatusButton('Sleeping'),
                    _buildStatusButton('On Duty'),
                    _buildStatusButton('Driving'),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Divider(height: 1.h, color: Color(0xffE2E8F0)),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularStatusWidget(
                      color: Color(0xFFFFA726), // Orange
                      time: '00:00',
                      status: 'Break',
                      progress: 0.2,
                    ),
                    CircularStatusWidget(
                      color: Color(0xFF66BB6A), // Green
                      time: '00:00',
                      status: 'Sleep',
                      progress: 0.3,
                    ),
                    CircularStatusWidget(
                      color: Color(0xFF42A5F5), // Blue
                      time: '00:00',
                      status: 'On Duty',
                      progress: 0.4,
                    ),
                    CircularStatusWidget(
                      color: Color(0xFF26A69A), // Teal
                      time: '00:00',
                      status: 'Driving',
                      progress: 0.25,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.formEditScreen);
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.edit_note_outlined),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(5.r),
                      decoration: BoxDecoration(
                        color: Color(0xfff8f9fa),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextView(
                            "Shipping docs",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Color(0xff636F85),
                          ),
                          CustomTextView(
                            "N/A",
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xff2D2D2D),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: Color(0xfff8f9fa),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextView(
                                  "Note",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: Color(0xff636F85),
                                ),
                                CustomTextView(
                                  "Sleep",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: Color(0xff2D2D2D),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: Color(0xfff8f9fa),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextView(
                                  "Trailers",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: Color(0xff636F85),
                                ),
                                CustomTextView(
                                  "Bobtail",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: Color(0xff2D2D2D),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
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
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: controller.selectedPeriod.value,
                            icon: Icon(Icons.keyboard_arrow_down, size: 18.r),
                            items: ['Today', 'Yesterday', 'This Week', 'This Month']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(fontSize: 14.sp)),
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
                      values: [0,0,0,0,1,1,2,2,2,1,0,0,3,3,3],
                      xLabels: [
                        "M1","2","3","4","5","6",
                        "7","8","9","10","11",
                        "N1","2","3","4","5","6"
                      ],
                      cellWidth: 40,
                      cellHeight: 30,
                    ),
                  ),
                ),
              ],
            ),
          )

          ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButton(String status) {
    final isSelected = controller.selectedStatus == status;
    return GestureDetector(
      onTap: () => controller.selectStatus(status),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: isSelected ? Color(0xff2DD4C5) : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.teal : Colors.grey,
                width: isSelected ? 3.0.w : 1.0.w,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(statusIcons[status]!, width: 24.w, height: 24.h),
                  SizedBox(height: 4.h),
                  Text(
                    status,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          if (isSelected)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2.w),
                ),
                child: Icon(Icons.sync, size: 16.r, color: Colors.blue),
              ),
            ),
        ],
      ),
    );
  }
}
