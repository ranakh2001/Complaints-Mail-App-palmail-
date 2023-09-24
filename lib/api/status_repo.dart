import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/models/satuses.dart';

import '../controller/user_controller.dart';
import '../core/helpers/api_base_helper.dart';
import '../models/mail.dart';
import '../models/user.dart';

class StatusRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<MailStatus>> getAllStatuses(bool mails) async {
    User2 user = await getLocalUser();
    final allStatuses = await _helper.get('/statuses?mail=$mails', {
      'Authorization': 'Bearer ${user.token}',
    });
    return Statuses.fromJson(allStatuses).statuses!;
  }

  Future<List<Mail>> getStatusMails(int statusId) async {
    List<MailStatus> statuses = await getAllStatuses(true);
    List<Mail> statusMails = statuses[statusId].mails!;
    return statusMails;
  }
}
