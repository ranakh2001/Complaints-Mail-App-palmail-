import 'package:finalproject/models/satuses.dart';
import 'package:flutter/material.dart';

import '../api/status_repo.dart';
import '../core/helpers/api_response.dart';
import '../models/mail.dart';

class StatusProvider extends ChangeNotifier {
  late StatusRepository _statusesRepo;

  late ApiResponse<List<MailStatus>> _statusList;
  late ApiResponse<List<Mail>> _statusMailsList;

  ApiResponse<List<MailStatus>> get statusList => _statusList;
  ApiResponse<List<Mail>> get statusMailsList => _statusMailsList;

  static MailStatus? selectedstatus;

  StatusProvider() {
    _statusesRepo = StatusRepository();
    fetchStatuses();
  }

  fetchStatuses() async {
    _statusList = ApiResponse.loading('Fetching statuses');
    notifyListeners();
    try {
      List<MailStatus> mailStauses = await _statusesRepo.getAllStatuses(false);
      _statusList = ApiResponse.completed(mailStauses);
      notifyListeners();
    } catch (e) {
      _statusList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  fetchStatusMails(int id) async {
    _statusMailsList = ApiResponse.loading('Fetching mails');
    notifyListeners();
    try {
      List<Mail> statusMails = await _statusesRepo.getStatusMails(id);
      _statusMailsList = ApiResponse.completed(statusMails);
      notifyListeners();
    } catch (e) {
      _statusList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }

  toggleStatus(MailStatus status) {
    status.isSelected = !status.isSelected;
    notifyListeners();
    if (status.isSelected) {
      selectedstatus = status;
      notifyListeners();
    }
  }
}
