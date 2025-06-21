// lib/features/home/widget/circular_status_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/features/home/widget/circular_progress_painter.dart';

class CircularStatusWidget extends StatelessWidget {
  final Color color;
  final String time;
  final String status;
  final double progress; // Optional progress value (default 0.2)

  const CircularStatusWidget({
    super.key,
    required this.color,
    required this.time,
    required this.status,
    this.progress = 0.2, // Default progress value
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
        width: 60.w,
        height: 60.h,
        child: CustomPaint(
          painter: CircularProgressPainter(
            progress: progress,
            backgroundColor: Colors.grey.shade200,
            progressColor: color,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 10.sp, // Smaller font for status to fit
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}