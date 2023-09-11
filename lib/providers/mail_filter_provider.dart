import 'package:finalproject/constants.dart';
import 'package:finalproject/models/category.dart';
import 'package:finalproject/models/satus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MailFilterProvider extends ChangeNotifier {
  List<Category> categorys = [
    Category(title: 'Official organization'),
    Category(title: "NGO's"),
    Category(title: 'UnBorder'),
    Category(title: 'Other')
  ];

  List<Status> statuses = [
    Status(title: 'In box', color: kinBoxStatus),
    Status(title: 'Pending', color: kpendingStatus),
    Status(title: 'In progress', color: kinProgressStatus),
    Status(title: 'Completed', color: kcompletedStatus),
  ];

  List<DateTime> dates = [DateTime.now()];

  void toggleCategory(int index) {
    categorys[index].isSelected = !categorys[index].isSelected;
    notifyListeners();
  }

  void toggleStatus(int index) {
    statuses[index].isSelected = !statuses[index].isSelected;
    notifyListeners();
  }
}
