import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';
import 'package:mmets/features/menu/controller/add_maintenance_controller.dart';

import '../../../../core/global_widget/custom_button.dart';
import '../../../../core/global_widget/custom_text.dart';
import '../../../../core/global_widget/custom_textField.dart';

class AddMaintenanceScreen extends StatelessWidget {
  AddMaintenanceScreen({super.key});

  final AddMaintenanceController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: CustomAppBar(title: 'Add Maintenance history'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEDEEF4),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextView(
                        "Serial Number",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF636F85),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "DM TA-11-5578",
                      controller: controller.nameController,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextView(
                        "Vehicle Type",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF636F85),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "Truck",
                      controller: controller.addressController,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextView(
                                'Date',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextView(
                                'Time',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.selectDate(),
                                child: Obx(
                                  () => Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextView(
                                          controller.selectedDate.value
                                              .toLocal()
                                              .toString()
                                              .split(' ')[0],
                                          fontSize: 14,
                                        ),
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => controller.selectTime(),
                                child: Obx(
                                  () => Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextView(
                                          controller.selectedTime.value.format(
                                            context,
                                          ),
                                          fontSize: 14,
                                        ),
                                        const Icon(Icons.access_time, size: 18),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              CustomButton(
                onPressed: () {
                  Get.back();
                },
                text: "Submit",
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
