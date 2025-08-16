import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../fuel/screen/fuel_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../menu/screen/menu_screen.dart';
import '../../route/screen/route_screen.dart';

class MainViewController extends GetxController {
  var currentIndex = 0.obs;

  final screens = [
    HomeScreen(),
    RouteScreen(),
    FuelScreen(),
    MenuScreen()
  ].obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  Widget get currentPage => screens[currentIndex.value];
}