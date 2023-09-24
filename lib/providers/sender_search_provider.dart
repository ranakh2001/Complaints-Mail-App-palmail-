import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/sender.dart';

class SenderSearchProvider extends ChangeNotifier {
  TextEditingController senderSearchController = TextEditingController();
  List<Datum> orgsSenders = [];
  List<Datum> otherSenders = [];
  List<Datum> NGOsSenders = [];
  List<Datum> foreignSenders = [];

  List<Datum> filteredSenders = [];
  Datum selectedSender = Datum(name: '', mobile: '', categoryId: '');

  void searchSender(String query) {
    final filteredOrgSenders = orgsSenders.where(
      (sender) => sender.name!.toLowerCase().contains(query.toLowerCase()),
    );

    final filteredOtherSenders = otherSenders.where(
      (sender) => sender.name!.toLowerCase().contains(query.toLowerCase()),
    );
    final filteredNGOsSenders = NGOsSenders.where(
      (sender) => sender.name!.toLowerCase().contains(query.toLowerCase()),
    );

    final filteredForeignSenders = foreignSenders.where(
      (sender) => sender.name!.toLowerCase().contains(query.toLowerCase()),
    );

    filteredSenders = [
      ...filteredOrgSenders,
      ...filteredOtherSenders,
      ...filteredNGOsSenders,
      ...filteredForeignSenders
    ];
    notifyListeners();
  }

  void updateSelectedSender(sender) {
    selectedSender = sender;
    notifyListeners();
  }
}
