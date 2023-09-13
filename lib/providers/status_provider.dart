import 'package:finalproject/models/satuses.dart';
import 'package:flutter/material.dart';

import '../api/status_repo.dart';
import '../core/helpers/api_response.dart';

class StatusProvider extends ChangeNotifier {
  late StatusRepository _statusesRepo;

  late ApiResponse<List<MailStatus>> _statusList;

  ApiResponse<List<MailStatus>> get statusList => _statusList;

  StatusProvider() {
    _statusesRepo = StatusRepository();
    fetchStatuses();
  }

    fetchStatuses() async {
    _statusList = ApiResponse.loading('Fetching statuses');
    notifyListeners();
    try {
      List<MailStatus> mailStauses = await _statusesRepo.getAllStatuses();
      _statusList = ApiResponse.completed(mailStauses);
      notifyListeners();
    } catch (e) {
      _statusList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
