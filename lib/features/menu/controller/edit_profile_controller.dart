import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/global_widget/image_picker_controller.dart';

class EditProfileController extends GetxController {
  RxString imageUrl =
      'https://firebasestorage.googleapis.com/v0/b/app-screenshot-352c0.appspot.com/o/images.png?alt=media&token=de8df7bb-6d43-4b36-82f2-82db07f5026c'
          .obs;
  final imagePickerController = Get.put(ImagePickerController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final RxString selectedFileName = ''.obs;
  final RxString selectedGender = ''.obs;
  final List<String> genderOptions = ['Male', 'Female'];

  Future<void> pickLicenseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.name.isNotEmpty) {
      selectedFileName.value = result.files.single.name;
    }
  }
}
