import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool isReadonly;
  final int maxLines;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.validator,
    this.controller,
    this.isReadonly = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        readOnly: isReadonly,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
            color: Color(0xff636F85),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon:
          prefixIcon != null
              ? Icon(prefixIcon, color: Colors.grey)
              : null,
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10.r),
        ),
      ),
    );
  }
}
