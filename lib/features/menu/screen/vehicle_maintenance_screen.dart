import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmets/core/routes/app_route.dart';

import '../../../core/global_widget/custom_text.dart';
import '../../../core/utils/app_colors.dart';
import '../../fuel/screen/fuel_screen.dart';
import '../controller/vehicle_maintenance_controller.dart';
import '../widget/engine_widget.dart';
import '../widget/maintenance_item.dart';

class VehicleMaintenanceScreen extends StatelessWidget {
  VehicleMaintenanceScreen({super.key});

  final VehicleMaintenanceController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Vehicle Maintenance",
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
                Get.toNamed(AppRoute.addMaintenanceScreen);
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
            children: [
              SizedBox(height: 10.h),
              CustomTextView(
                "Next Service",
                color: const Color(0xFF636F85),
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
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
                          '50',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                        CustomTextView(
                          'Days',
                          fontSize: 14.sp,
                          color: Color(0xff636F85),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextView(
                      'Vehicle Summary',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextView(
                          'Name',
                          fontSize: 14.sp,
                          color: Color(0xFF636F85),
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextView(
                          '10000',
                          fontSize: 14.sp,
                          color: Color(0xFF2D2D2D),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextView(
                          'License Number',
                          fontSize: 14.sp,
                          color: Color(0xFF636F85),
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextView(
                          ' TSi 24552020',
                          fontSize: 14.sp,
                          color: Color(0xFF2D2D2D),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextView(
                          'Model',
                          fontSize: 14.sp,
                          color: Color(0xFF636F85),
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextView(
                          'T-5256',
                          fontSize: 14.sp,
                          color: Color(0xFF2D2D2D),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SizedBox(
                  height: 290.h,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.w,
                    mainAxisSpacing: 5.h,
                    childAspectRatio: 0.75,
                    children: [
                      EngineWidget(
                        icon: Icons.settings_outlined,
                        title: 'Engine',
                        temperature: '205°F',
                      ),
                      EngineWidget(
                        icon: Icons.battery_saver_sharp,
                        title: 'Battery',
                        temperature: '13.5 V',
                      ),
                      EngineWidget(
                        icon: Icons.error_outline,
                        title: 'Error Log',
                        temperature: 'P104',
                      ),
                      EngineWidget(
                        icon: Icons.circle_outlined,
                        title: 'Brake pad',
                        temperature: '25%',
                      ),
                      EngineWidget(
                        icon: Icons.electric_bolt_outlined,
                        title: 'ABS',
                        temperature: 'OK',
                      ),
                      EngineWidget(
                        icon: Icons.ac_unit_outlined,
                        title: 'AC',
                        temperature: '75°F',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextView(
                    "Maintenance History ",
                    color: const Color(0xFF2D2D2D),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.addMaintenanceScreen);
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
                      "+ Add",
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
                  return MaintenanceItem(
                    id: 'DM TA-11-5578',
                    type: 'Transit Van • Truck',
                    dateTime: '12 July 25 • 11:00 am',
                    price: '\$480',
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
