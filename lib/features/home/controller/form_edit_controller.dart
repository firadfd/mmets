import 'package:get/get.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class FormEditController extends GetxController {
  var selectedShippingDoc = ''.obs;
  var selectedTrailer = ''.obs;
  var selectedNote = ''.obs;

  // Dropdown options
  final shippingDocs = ["Bill of Lading", "Invoice", "fsdhakjf"];
  final trailers = ["Flatbed", "Reefer", "Bobtail"];
  final notes = ["On Duty", "Off Duty", "Sleep"];
}
