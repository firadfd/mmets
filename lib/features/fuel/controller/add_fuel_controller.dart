import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFuelController extends GetxController {
  var selectedFuelType = 'Diesel'.obs;
  var selectedDate = DateTime(2025, 9, 6).obs;
  var selectedTime = TimeOfDay(hour: 15, minute: 26).obs;
  var selectedQuantity = '12 L'.obs;
  var price = '\$43.52'.obs;
  final List<String> quantities = ['12 L', '24 L', '36 L'];

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) selectedDate.value = picked;
  }

  Future<void> selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
    );
    if (picked != null) selectedTime.value = picked;
  }

  void updateFuelType(String fuelType) {
    selectedFuelType.value = fuelType;
  }
}
