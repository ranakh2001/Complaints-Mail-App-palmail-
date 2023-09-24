import 'dart:convert';

import 'package:finalproject/models/mail.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<bool> createNewMail(
    {required String subject,
    String? description,
    required int senderId,
    required String archive,
    required DateTime date,
    String? decision,
    required int status_id,
    String? final_decision,
    List<int>? tags,
    List<Map<String, dynamic>>? activities}) async {
  final Map<String, dynamic> body = {
    'subject': subject,
    'description': description ?? '',
    'sender_id': '$senderId',
    'archive_number': archive,
    'archive_date': "$date",
    'decision': decision ?? '',
    'status_id': '$status_id',
    'final_decision': '',
    'tags': jsonEncode(tags ?? []),
    'activities': jsonEncode(activities ?? [])
  };
  print(date.toString());

  final response = await http.post(
    Uri.parse(createMailUrl),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: body,
  );

  print(body);

  print(response.statusCode);

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    print(responseData);
    return true;
  } else if (response.statusCode == 422) {
    final Map<String, dynamic> errorData = jsonDecode(response.body);
    print("Validation Errors: $errorData");
    return false;
  }
  return Future.error('Failed to create mail: ${response.statusCode}');
}
