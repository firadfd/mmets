import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/features/home/widget/custom_app_bar.dart';

import '../../../core/routes/app_route.dart';
import '../../../core/utils/app_colors.dart';
import '../controller/fuel_controller.dart';
import '../widget/fuel_item.dart';

class FuelScreen extends StatelessWidget {
  FuelScreen({super.key});

  final FuelController controller = Get.find();

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
              SizedBox(height: 10.h),
              Container(
                height: 250.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(120.w, 120.h),
                      painter: DoughnutPainter(
                        usedPercentage: 0.7,
                        availablePercentage: 0.3,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextView(
                          '46L',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4CAF50),
                        ),
                        CustomTextView(
                          'TOTAL FUEL',
                          fontSize: 14.sp,
                          color: Color(0xff636F85),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 20.w,
                      bottom: 20.h,
                      child: Row(
                        children: [
                          Container(
                            width: 10.w,
                            height: 10.w,
                            color: Color(0xFFB3E5FC),
                          ),
                          SizedBox(width: 5.w),
                          CustomTextView(
                            '30% Available',
                            fontSize: 16.sp,
                            color: Color(0xff636F85),
                          ),
                          SizedBox(width: 20.w),
                          Container(
                            width: 10.w,
                            height: 10.w,
                            color: Color(0xFF4CAF50),
                          ),
                          SizedBox(width: 5.w),
                          CustomTextView(
                            '70% Fuel Used',
                            fontSize: 16.sp,
                            color: Color(0xff636F85),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextView(
                    "Fuel History",
                    color: const Color(0xFF2D2D2D),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.addFuelScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      shadowColor: Colors.transparent,
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(10.r),
                    ),
                    child: Text(
                      "+ Add Fuel",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return FuelItem(
                    liters: '20L',
                    dateTime: '24/04/2025 - 13:00',
                    stationName: 'Feal Station Name',
                    cost: '\$120',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoughnutPainter extends CustomPainter {
  final double usedPercentage;
  final double availablePercentage;

  DoughnutPainter({
    required this.usedPercentage,
    required this.availablePercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    paint.color = Color(0xFFB3E5FC);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * availablePercentage,
      false,
      paint,
    );

    paint.color = Color(0xFF4CAF50);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + 2 * pi * availablePercentage,
      2 * pi * usedPercentage,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
