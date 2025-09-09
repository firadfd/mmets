import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';
import 'package:mmets/core/utils/app_colors.dart';

import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/global_widget/custom_textField.dart';
import '../controller/add_fuel_info_controller.dart';

class AddFuelInfoScreen extends StatelessWidget {
  AddFuelInfoScreen({super.key});

  final AddFuelInfoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: CustomAppBar(title: 'Add Fuel info'),
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
                        "Incident",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF636F85),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "Enter Incident Name",
                      controller: controller.nameController,
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
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextView(
                        "Description of Incident",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF636F85),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      hintText: "Description...",
                      controller: controller.descController,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Obx(
                () => DottedBorder(
                  color: Colors.grey.shade400,
                  strokeWidth: 1.5,
                  dashPattern: [6, 3],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(14.r),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        Icon(Icons.camera_alt, size: 35.r),
                        SizedBox(height: 11.h),
                        CustomTextView(
                          "Front side of your Driving License",
                          textAlign: TextAlign.center,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2D2D2D),
                        ),
                        SizedBox(height: 4.h),
                        CustomTextView(
                          "Upload the front side of your docuement \nSupports: JPG, PNG, PDF",
                          textAlign: TextAlign.center,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF636F85),
                        ),

                        // PREVIEW FILES (Images or PDFs)
                        if (controller.deedUrlsFiles.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            child: SizedBox(
                              height: 80.h,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.deedUrlsFiles.length,
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 10.w),
                                itemBuilder: (context, index) {
                                  final file = controller.deedUrlsFiles[index];
                                  final isPdf = file.path
                                      .toLowerCase()
                                      .endsWith(".pdf");

                                  return Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        child: isPdf
                                            ? Container(
                                                width: 80.w,
                                                height: 80.h,
                                                color: const Color(0xFFE0E0E0),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.picture_as_pdf,
                                                    color: Colors.red,
                                                    size: 36.sp,
                                                  ),
                                                ),
                                              )
                                            : Image.file(
                                                file,
                                                width: 80.w,
                                                height: 80.h,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Positioned(
                                        top: 2,
                                        right: 2,
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.deedUrlsFiles.removeAt(
                                              index,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(
                                                0.6,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            padding: EdgeInsets.all(4.r),
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                              size: 14.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),

                        // BUTTON: Choose a file
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          child: SizedBox(
                            height: 35.h,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      controller.pickDeedUrlsFiles();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: CustomTextView(
                                        "Choose a file",
                                        textAlign: TextAlign.center,
                                        color: AppColors.primaryColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
