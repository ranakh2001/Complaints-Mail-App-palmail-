import 'package:finalproject/api/search_repo.dart';
import 'package:finalproject/models/mail.dart';
import 'package:finalproject/providers/status_provider.dart';
import 'package:flutter/material.dart';

import '../core/helpers/api_response.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  late SearchRepository _searchRepo;
  late ApiResponse<List<Mail>> _searchMailsList;

  ApiResponse<List<Mail>> get searchMails => _searchMailsList;
  bool startSearch = false;

  List<DateTime?> datePicker = [];
  List<DateTime> dates = [];

  int? statusid;
  int? categoryId;
  addDate() {
    dates.add(datePicker.first!);
    print(dates);
    notifyListeners();
  }

  SearchProvider() {
    _searchRepo = SearchRepository();
  }

  fetchMails(String text) async {
    startSearch = true;
    notifyListeners();
    _searchMailsList = ApiResponse.loading('Fetching statuses');
    notifyListeners();
    try {
      List<Mail> mail = await _searchRepo.searchByText(
          text,
          dates.isEmpty ? '' : dates.first.toString(),
          dates.isEmpty ? '' : dates.last.toString(),
          StatusProvider.selectedstatus == null
              ? ''
              : StatusProvider.selectedstatus!.id.toString());
      _searchMailsList = ApiResponse.completed(mail);
      notifyListeners();
    } catch (e) {
      _searchMailsList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
