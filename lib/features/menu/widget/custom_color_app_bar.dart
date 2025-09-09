import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/app_colors.dart';

class CustomColorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? centerTitle;

  const CustomColorAppBar({super.key, required this.title, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: AppColors.primaryColor,
      centerTitle: centerTitle ?? true,
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.06);
}
