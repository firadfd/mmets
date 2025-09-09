import 'package:get/get.dart';

class DispatchScheduleController extends GetxController {
  final selectedMonth = 11.obs; // 1..12
  final selectedYear = 2025.obs;
  final selectedDate = DateTime(2025, 11, 22).obs;

  final months = const [
    'January','February','March','April','May','June',
    'July','August','September','October','November','December'
  ];
  final weekdayShort = const ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];

  // Year options (adjust as needed)
  final List<int> years =
  List.generate(15, (i) => DateTime.now().year - 5 + i);

  int get _daysInCurrentMonth =>
      DateTime(selectedYear.value, selectedMonth.value + 1, 0).day;

  List<DateTime> get datesForCurrentMonth => List.generate(
    _daysInCurrentMonth,
        (i) => DateTime(selectedYear.value, selectedMonth.value, i + 1),
  );

  String weekdayName(DateTime d) => weekdayShort[d.weekday - 1];

  void changeMonth(int m) {
    selectedMonth.value = m;
    _clampSelectedDay();
  }

  void changeYear(int y) {
    selectedYear.value = y;
    _clampSelectedDay();
  }

  void selectDay(DateTime d) => selectedDate.value = d;

  void _clampSelectedDay() {
    final maxDay = _daysInCurrentMonth;
    final current = selectedDate.value;
    final clampedDay = current.day.clamp(1, maxDay);
    selectedDate.value = DateTime(selectedYear.value, selectedMonth.value, clampedDay);
  }
}