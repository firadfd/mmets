import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mmets/core/global_widget/custom_text.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final List<String> items;
  final RxString selectedValue;

  const CustomDropdown({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextView(title,
                  fontWeight: FontWeight.bold, color: Colors.grey),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue.value.isEmpty
                  ? null
                  : selectedValue.value,
              hint: CustomTextView("Select option",fontWeight: FontWeight.w500, color: Colors.grey),
              isExpanded: true,
              items: items
                  .map((item) =>
                  DropdownMenuItem(value: item, child: CustomTextView(item)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedValue.value = value;
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}
