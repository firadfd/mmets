// add_fuel_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';
import 'package:mmets/core/global_widget/custom_text.dart';
import 'package:mmets/core/utils/asset_path.dart';

import '../controller/add_fuel_controller.dart';
import '../widget/fuel_type_item.dart';

class AddFuelScreen extends StatelessWidget {
  AddFuelScreen({super.key});

  final AddFuelController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Fuel info"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 230.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  color: Color(0xFFEDEEF4),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Container(
                      height: 90.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(size: 24.r, Icons.local_gas_station),
                              SizedBox(width: 10.w),
                              CustomTextView(
                                "Fuel Station Name",
                                color: const Color(0xFF2D2D2D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(size: 24.r, Icons.location_on_outlined),
                              SizedBox(width: 10.w),
                              CustomTextView(
                                "Fuel Station location",
                                color: const Color(0xFF2D2D2D),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextView(
                        "Select Fuel Type",
                        color: const Color(0xFF2D2D2D),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => FuelTypeItem(
                            title: 'Petrol',
                            icon: AssetPath.fuel,
                            isSelected:
                                controller.selectedFuelType.value == 'Petrol',
                            onTap: () => controller.updateFuelType('Petrol'),
                          ),
                        ),
                        Obx(
                          () => FuelTypeItem(
                            title: 'Diesel',
                            icon: AssetPath.fuel,
                            isSelected:
                                controller.selectedFuelType.value == 'Diesel',
                            onTap: () => controller.updateFuelType('Diesel'),
                          ),
                        ),
                        Obx(
                          () => FuelTypeItem(
                            title: 'Gas',
                            icon: AssetPath.fuel,
                            isSelected:
                                controller.selectedFuelType.value == 'Gas',
                            onTap: () => controller.updateFuelType('Gas'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEDEEF4),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => CustomTextView(
                              'Date: ${controller.selectedDate.value.toLocal().toString().split(' ')[0]}',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => controller.selectDate(),
                          child: Text('Pick Date'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => CustomTextView(
                              'Time: ${controller.selectedTime.value.format(context)}',
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => controller.selectTime(),
                          child: CustomTextView('Pick Time'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => DropdownButton<String>(
                              value: controller.selectedQuantity.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.selectedQuantity.value = newValue;
                                }
                              },
                              items: controller.quantities
                                  .map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: CustomTextView(value),
                                    );
                                  })
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => CustomTextView(
                              'Price: ${controller.price.value}',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
