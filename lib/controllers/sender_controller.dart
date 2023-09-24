import 'dart:convert';
import 'package:finalproject/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

Future<bool> createNewSender({
  required String name,
  required int mobile,
  String? address,
  required int categoryId,
}) async {
  final Map<String, dynamic> body = {
    'name': name,
    'mobile': mobile,
    'address': address ?? '',
    'category_id': '$categoryId',
  };

  final response = await http.post(
    Uri.parse(createSenderUrl),
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
  return Future.error('Failed to create Sender: ${response.statusCode}');
}
