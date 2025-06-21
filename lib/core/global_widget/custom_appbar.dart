import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? centerTitle;

  const CustomAppBar({super.key, required this.title, this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      centerTitle: centerTitle ?? true,
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.06);
}
