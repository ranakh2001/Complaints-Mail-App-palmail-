import 'dart:convert';
import 'package:finalproject/constants.dart';
import 'package:http/http.dart' as http;

import '../models/sender.dart';

Future<List<Datum>> getAllSenders() async {
  final response = await http.get(Uri.parse(getSendersUrl),
      headers: {'Authorization': 'Bearer $token'});

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> senderList = data['senders']['data'];
    print(senderList.toString());

    return senderList.map((senderJson) => Datum.fromJson(senderJson)).toList();
  }
  return Future.error('Failed to load senders');
}
