import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateArchiveProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  String dayName = DateFormat('EEEE').format(DateTime.now());

  final DateTime firstDate = DateTime(2020, 1);
  final DateTime lastDate = DateTime(2100, 12);

  Future<void> openDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.red.withOpacity(0.5),
            colorScheme:
                ColorScheme.light(primary: Colors.red.withOpacity(0.8)),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      updateDateAndName(date);
    }
  }

  void updateDateAndName(DateTime date) {
    selectedDate = date;
    dayName = DateFormat('EEEE').format(date);
    notifyListeners();
  }
}
