import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';


class CustomPasswordField extends StatelessWidget {
  RxBool isVisible = true.obs;

  final String hints;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomPasswordField({
    super.key,
    required this.hints,
    this.controller,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Obx(
                  () => TextFormField(
                validator: validator,
                obscureText: isVisible.value,
                controller: controller,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                    color: Color(0xff636F85),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: hints,
                  prefixIcon:
                  prefixIcon != null
                      ? Icon(prefixIcon, color: Colors.grey)
                      : null,
                  errorMaxLines: 3,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.r),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          InkWell(
            onTap: () {
              if (isVisible.value == true) {
                isVisible.value = false;
              } else {
                isVisible.value = true;
              }
            },
            child: Obx(
                  () =>
              isVisible == true
                  ? Icon(Icons.visibility_off_outlined, color: Colors.grey)
                  : Icon(Icons.visibility_outlined, color: Colors.grey),
            ),
          ),
          SizedBox(width: 18),
        ],
      ),
    );
  }
}
