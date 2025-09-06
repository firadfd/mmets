import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/core/global_widget/custom_text.dart';

class FuelItem extends StatelessWidget {
  final String liters;
  final String dateTime;
  final String stationName;
  final String cost;

  const FuelItem({
    Key? key,
    required this.liters,
    required this.dateTime,
    required this.stationName,
    required this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CustomTextView(
                    liters,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextView(
                    dateTime,fontSize: 13.sp, color: Colors.black,fontWeight: FontWeight.bold
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16.0, color: Colors.blue),
                      SizedBox(width: 4.0),
                      CustomTextView(
                        stationName,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          CustomTextView(
            cost,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
          ),
        ],
      ),
    );
  }
}
