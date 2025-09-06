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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyLarge: const TextStyle(fontSize: 16),
              bodyMedium: const TextStyle(fontSize: 14),
              labelLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              headlineSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              headlineLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              displayMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              displaySmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              displayLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodySmall: const TextStyle(fontSize: 14),
            ),
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) selectedDate.value = picked;
  }

  Future<void> selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime.value,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyLarge: const TextStyle(fontSize: 16),
              bodyMedium: const TextStyle(fontSize: 14),
              labelLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

              titleMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              headlineMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              headlineSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              headlineLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              displayMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              displaySmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              displayLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              bodySmall: const TextStyle(fontSize: 14),
            ),
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) selectedTime.value = picked;
  }




  void updateFuelType(String fuelType) {
    selectedFuelType.value = fuelType;
  }
}
