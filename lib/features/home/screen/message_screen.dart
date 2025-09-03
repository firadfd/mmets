import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';

import '../../../core/global_widget/custom_appbar.dart';
import '../controller/message_controller.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.image, color: Colors.blue),
                title: const Text('Photo'),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.green),
                title: const Text('Camera'),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.insert_drive_file, color: Colors.orange),
                title: const Text('File'),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final MessageController controller = Get.find();

    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      appBar: CustomAppBar(title: "Messages"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child:Obx(
              () => DashChat(
            currentUser: controller.me,
            messages: controller.messages.toList(),
            onSend: controller.sendMessage,
            inputOptions: InputOptions(
              inputDecoration: InputDecoration(
                hintText: "Type a message...",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              ),
              sendButtonBuilder: (onSend) => CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white, size: 18),
                  onPressed: onSend,
                ),
              ),
              leading: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () => _showAttachmentOptions(context),
                ),
              ],

            ),

            messageOptions: MessageOptions(
              showTime: false,
              showOtherUsersName: true,
              currentUserContainerColor: Colors.blue,
              containerColor: Colors.grey.shade300,
              textColor: Colors.black,
              currentUserTextColor: Colors.white,
            ),
          ),
        )

      ),
    );
  }
}
