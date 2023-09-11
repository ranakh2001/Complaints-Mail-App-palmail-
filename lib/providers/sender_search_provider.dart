import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SenderSearchProvider with ChangeNotifier {
  TextEditingController senderSearchController = TextEditingController();
  List<String> orgsSenders = ['Logain', 'Rana', 'Tasneem'];
  List<String> otherSenders = ['Logain', 'Rana', 'Tasneem'];
  List<String> filteredSenders = [];

  void searchSender(String query) {
    final filteredOrgSenders = orgsSenders.where(
      (sender) => sender.toLowerCase().contains(query.toLowerCase()),
    );

    final filteredOtherSenders = otherSenders.where(
      (sender) => sender.toLowerCase().contains(query.toLowerCase()),
    );

    filteredSenders = [...filteredOrgSenders, ...filteredOtherSenders];
    notifyListeners();
  }
}
