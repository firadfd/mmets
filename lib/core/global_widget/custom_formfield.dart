import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';

class CustomFormfield extends StatelessWidget {
  const CustomFormfield({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.validationMessage,
    this.fontWeight,
    this.fontSize,
    this.keyboardType = TextInputType.text,
    this.isReadOnly=false
  });

  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardType;
  final String? validationMessage;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: AppColors.secondaryColor,
      readOnly: isReadOnly,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return validationMessage ?? 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        // Enable filling the background
        fillColor: Color(0xFFF9F9FB),
        // Set the background color to amber
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.w),
          borderRadius: BorderRadius.circular(50.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.w),
          borderRadius: BorderRadius.circular(50.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.w),
          borderRadius: BorderRadius.circular(50.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.w),
          // Optional: Set error border color
          borderRadius: BorderRadius.circular(12.r),
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: AppColors.lightGrey,
        ),
      ),
    );
  }
}
