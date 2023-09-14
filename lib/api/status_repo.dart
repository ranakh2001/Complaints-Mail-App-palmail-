import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/models/satuses.dart';

import '../core/helpers/api_base_helper.dart';
import '../models/mail.dart';

class StatusRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<MailStatus>> getAllStatuses(bool mails) async {
    final allStatuses = await _helper.get('/statuses?mail=$mails', {
      'Authorization': 'Bearer $token',
    });
    return Statuses.fromJson(allStatuses).statuses!;
  }

  Future<List<Mail>> getStatusMails(int statusId) async {
    List<MailStatus> statuses = await getAllStatuses(true);
    List<Mail> statusMails = statuses[statusId].mails!;
    return statusMails;
  }
}
