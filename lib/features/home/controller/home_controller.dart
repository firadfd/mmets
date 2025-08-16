import 'package:get/get.dart';

import '../model/log_data.dart';

class HomeController extends GetxController {
  final RxString _selectedStatus = 'Off Duty'.obs;

  String get selectedStatus => _selectedStatus.value;

  void selectStatus(String status) {
    _selectedStatus.value = status;
  }

  final RxMap<String, String> statusTimes = <String, String>{
    'Break': '00:00',
    'Sleep': '00:00',
    'On Duty': '00:00',
    'Driving': '00:00',
  }.obs;

  RxString selectedPeriod = 'Today'.obs;
  void selectPeriod(String period) {
    selectedPeriod.value = period;
  }

  void updateTime(String status, String time) {
    statusTimes[status] = time;
    statusTimes.refresh();
  }

  final logData = <LogData>[
    LogData('OFF', 2),
    LogData('SB', 9),
    LogData('D', 5),
    LogData('OFF', 3),
    LogData('ON', 12),].obs;


  void updateLogData(List<LogData> newData) {
    logData.assignAll(newData);
  }
}