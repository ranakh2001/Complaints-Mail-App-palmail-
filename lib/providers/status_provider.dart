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

  Future<List<MailStatus>> fetchStatuses() async {
    try {
      List<MailStatus> mailStauses = await _statusesRepo.getAllStatuses(false);
      return mailStauses;
    } catch (err) {
      return Future.error(err);
    }
  }

  Future<List<Mail>> fetchStatusMails(int id) async {
    try {
      List<Mail> statusMails = await _statusesRepo.getStatusMails(id);
      return statusMails;
    } catch (err) {
      return Future.error(err);
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
