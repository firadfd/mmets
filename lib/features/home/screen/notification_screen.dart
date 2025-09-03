import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mmets/core/global_widget/custom_appbar.dart';

import '../widget/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa),
      appBar: CustomAppBar(title: "Notifications"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return NotificationItem(
              title: "Prologeld v2.1 Released!",
              subtitle: "Prologeld v2.1 Released!",
              time: "09:00 AM",
              date: "15/04/2025",
              icon: Icons.alarm,
              iconBgColor: Colors.orange.shade100,
              iconColor: Colors.red,
              isRead: true,
            );
          },
        ),
      ),
    );
  }
}
