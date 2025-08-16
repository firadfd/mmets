import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/utils/asset_path.dart';
import '../../../core/utils/app_colors.dart';
import '../controller/main_view_controller.dart';

class MainViewScreen extends StatelessWidget {
  MainViewScreen({super.key});

  final MainViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentPage),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          elevation: 5.r,
          backgroundColor: AppColors.white,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: AppColors.primaryColor,
          items: [
            _bottomNavigationItem(
              controller.currentIndex.value == 0
                  ? AssetPath.homeActive
                  : AssetPath.homeInactive,
              'Home',
              controller.currentIndex.value == 0
                  ? AppColors.primaryColor
                  : Colors.grey,
            ),
            _bottomNavigationItem(
              controller.currentIndex.value == 1
                  ? AssetPath.routeActive
                  : AssetPath.routeInactive,
              'Route',
              controller.currentIndex.value == 1
                  ? AppColors.primaryColor
                  : Colors.grey,
            ),
            _bottomNavigationItem(
              controller.currentIndex.value == 2
                  ? AssetPath.fuelActive
                  : AssetPath.fuelInactive,
              'Fuel',
              controller.currentIndex.value == 2
                  ? AppColors.primaryColor
                  : Colors.grey,
            ),
            _bottomNavigationItem(
              controller.currentIndex.value == 3
                  ? AssetPath.menuActive
                  : AssetPath.menuActive,
              'Menu',
              controller.currentIndex.value == 3
                  ? AppColors.primaryColor
                  : Colors.grey,
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationItem(
      String AssetPath,
      String label,
      Color color,
      ) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 24.h,
        width: 24.w,
        child: Image.asset(AssetPath, color: color),
      ),
      label: label,
    );
  }
}
