import 'package:finalproject/models/mail.dart';
import 'package:finalproject/models/search_mails.dart';

import '../controller/user_controller.dart';
import '../core/helpers/api_base_helper.dart';
import '../models/user.dart';

class SearchRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Mail>> searchByText(
      String text, String? startDate, String? endDate, String? statusid) async {
    User2 user = await getLocalUser();
    final mails = await _helper
        .get('/search?text=$text&start=&end=&status_id=$statusid', {
      'Authorization': 'Bearer ${user.token}',
    });
    print(mails);
    return SearchMails.fromMap(mails).mails!;
  }
}
