import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/utils/asset_path.dart';

import '../../../core/routes/app_route.dart';
import '../../../core/utils/app_colors.dart';
import '../controller/menu_option_controller.dart';
import '../widget/custom_card_item.dart';
import '../widget/custom_menu_app_bar.dart';
import '../widget/profile_card.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final MenuOptionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMenuAppBar(
        onIconClick: () {
          print('Icon Clicked');
        },
        onEldClick: () {
          print('ELD Clicked');
        },
        onMessageClick: () {
          Get.toNamed(AppRoute.messageScreen);
        },
        onNotificationClick: () {
          Get.toNamed(AppRoute.notificationScreen);
        },
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 150.h,
            child: Container(
              padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
              color: AppColors.primaryColor,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.h),
                child: ProfileCard(
                  name: 'Thomas K. Wilson',
                  phone: '+44 20 1234 5629',
                  email: 'thomas.abc.inc@gmail.com',
                  imageUrl: "https://avatar.iran.liara.run/public/boy",
                  onCardClick: () {
                    Get.toNamed(AppRoute.editProfileScreen);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 130.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                color: AppColors.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 400.h,
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 5.h,
                            childAspectRatio: 0.75,
                            children: [
                              CustomCardItem(
                                title: 'Dispatch & Scheduling',
                                imageUrl: AssetPath.calender,
                                onTap: () {
                                  print('Card tapped at ${DateTime.now()}');
                                },
                              ),
                              CustomCardItem(
                                title: 'Incident & Accident Report',
                                imageUrl: AssetPath.incident,
                                onTap: () {
                                  print('Card tapped at ${DateTime.now()}');
                                },
                              ),
                              CustomCardItem(
                                title: 'Vehicle Maintenance ',
                                imageUrl: AssetPath.vehicle,
                                onTap: () {
                                  print('Card tapped at ${DateTime.now()}');
                                },
                              ),
                              CustomCardItem(
                                title: 'Driver Behavior Monitoring',
                                imageUrl: AssetPath.monitor,
                                onTap: () {
                                  Get.toNamed(AppRoute.driverBehaviorScreen);
                                },
                              ),
                              CustomCardItem(
                                title: 'Settings',
                                imageUrl: AssetPath.setting,
                                onTap: () {
                                  Get.toNamed(AppRoute.settingScreen);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
