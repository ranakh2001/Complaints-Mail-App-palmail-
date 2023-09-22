import 'package:finalproject/models/mail.dart';
import 'package:finalproject/models/search_mails.dart';

import '../core/helpers/api_base_helper.dart';
import '../core/util/constants.dart';

class SearchRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Mail>> searchByText(String text, String? startDate,
      String? endDate, String? statusid) async {
    final mails = await _helper.get(
        '/search?text=$text&start=&end=&status_id=$statusid',
        {
          'Authorization': 'Bearer $token',
        });
    print(mails);
    return SearchMails.fromMap(mails).mails!;
  }
}
