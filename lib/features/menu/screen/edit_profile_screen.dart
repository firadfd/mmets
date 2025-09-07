import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';
import 'package:mmets/core/utils/app_colors.dart';
import 'package:mmets/core/utils/asset_path.dart';

import '../../../core/global_widget/circular_progress_indicator.dart';
import '../../../core/global_widget/custom_button.dart';
import '../../../core/global_widget/custom_text.dart';
import '../../../core/global_widget/custom_textField.dart';
import '../controller/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final EditProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomButton(
          onPressed: () {
            Get.back();
          },
          text: "Save & Update",
          textColor: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Obx(
                () => Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: controller.imageUrl.value,
                        width: 80.r,
                        height: 80.r,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SizedBox(
                          width: 80.r,
                          height: 80.r,
                          child: customCircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 80.r,
                          height: 80.r,
                          color: Colors.grey,
                          child: const Icon(Icons.error, color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () =>
                            controller.imagePickerController.pickFromStorage(),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            AssetPath.edit,
                            color: Colors.white,
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextView(
                  "Full name",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF636F85),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                hintText: "Thomas K.Wilson",
                controller: controller.nameController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextView(
                  "Edit Address",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF636F85),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                hintText: "123 Elm Street, Springfield, IL 62704",
                controller: controller.addressController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextView(
                  "Email",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF636F85),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                hintText: "thomas.abc.inc@gmail.com",
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextView(
                  "Contact Number",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF636F85),
                ),
              ),
              SizedBox(height: 5.h),
              CustomTextField(
                hintText: "+99 25546 54418",
                controller: controller.numberController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextView(
                  "Driving License",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF636F85),
                ),
              ),
              SizedBox(height: 5.h),
              Obx(
                () => Container(
                  height: 52.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: GestureDetector(
                    onTap: () => controller.pickLicenseFile(),
                    child: Center(
                      child: CustomTextView(
                        controller.selectedFileName.value.isEmpty
                            ? "No file selected"
                            : controller.selectedFileName.value,
                        fontSize: 14.sp,
                        color: controller.selectedFileName.value.isEmpty
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomTextView(
                  "Gender",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF636F85),
                ),
              ),
              SizedBox(height: 5.h),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedGender.value.isEmpty
                      ? null
                      : controller.selectedGender.value,
                  hint: Text(
                    "Select",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                  items: controller.genderOptions.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(
                        gender,
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.selectedGender.value = newValue;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Color(0xFF636F85)),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
