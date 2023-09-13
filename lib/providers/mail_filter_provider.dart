
import 'package:flutter/material.dart';

class MailFilterProvider extends ChangeNotifier {
  List<DateTime> dates = [
    DateTime.now()
  ];

  // void toggleCategory(int index) {
  //   categorys[index].isSelected = !categorys[index].isSelected;
  //   notifyListeners();
  // }

  // void toggleStatus(int index) {
  //   statuses[index].isSelected = !statuses[index].isSelected;
  //   notifyListeners();
  // }
}
