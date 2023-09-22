import 'package:finalproject/core/helpers/api_base_helper.dart';

import '../core/util/constants.dart';

class MailRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  uploadImage(Map<String, dynamic> body) {
    final response = _helper.post(
        "/attachments",
        {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body);
    print(response);
  }

  deleteMail(String id) {
    final response = _helper.delete(
      "/mails/$id",
      {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response);
  }

  updateMail(Map<String, dynamic> body, String id) {
    final response = _helper.put(
        "/mails/$id",
        {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body);
    print(response);
  }
}
