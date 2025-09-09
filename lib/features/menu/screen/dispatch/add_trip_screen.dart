import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/features/menu/controller/add_trip_controller.dart';

import '../../../../core/global_widget/custom_appbar.dart';
import '../../../../core/global_widget/custom_button.dart';
import '../../../../core/global_widget/custom_text.dart';
import '../../../../core/global_widget/custom_textField.dart';

class AddTripScreen extends StatelessWidget {
  AddTripScreen({super.key});

  final AddTripController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: CustomAppBar(title: 'Add Trip'),
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
                        "Start From",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF636F85),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "Thompson Rd, Indoor, USA",
                      controller: controller.nameController,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextView(
                        "Destination",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF636F85),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "Pinak Rd, Outdoor, USA",
                      controller: controller.descController,
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
                                'Start Time',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextView(
                                'End Time',
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
                                'Duration',
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
                              child: CustomTextField(
                                hintText: "30 minutes",
                                controller: controller.descController,
                                keyboardType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  Get.back();
                },
                text: "Submit",
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
