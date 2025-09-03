import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';
import 'package:mmets/core/global_widget/custom_button.dart';

import '../../../core/routes/app_route.dart';
import '../controller/form_edit_controller.dart';
import '../widget/custom_dropdown.dart';

class FormEditScreen extends StatelessWidget {
  FormEditScreen({super.key});

  final FormEditController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      appBar: CustomAppBar(title: "Forms Edit"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xffEDEEF4),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  CustomDropdown(
                    title: "Shipping Docs",
                    items: controller.shippingDocs,
                    selectedValue: controller.selectedShippingDoc,
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdown(
                    title: "Trailers",
                    items: controller.trailers,
                    selectedValue: controller.selectedTrailer,
                  ),
                  SizedBox(height: 10.h),
                  CustomDropdown(
                    title: "Note",
                    items: controller.notes,
                    selectedValue: controller.selectedNote,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              onPressed: () {
                Get.back();
                // Get.toNamed(AppRoute.logPreviewScreen);
              },
              text: "Save",
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
