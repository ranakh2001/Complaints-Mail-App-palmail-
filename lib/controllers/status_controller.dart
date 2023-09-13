import 'dart:convert';
import 'package:finalproject/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/status_model.dart'; // Import your StatusModel

Future<List<StatusElement>> getStatusList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // User user = userFromJson(prefs.getString('user')!);
  final response = await http.get(
    Uri.parse(getStatusListUrl), // Replace with your actual API endpoint
    // headers:{'Authorization': 'Bearer ${user.token}'})
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    List<StatusElement> statusList = [];
    for (var statusData in jsonData) {
      statusList.add(StatusElement.fromJson(statusData));
    }
    return statusList;
  }
  return Future.error('Failed to load status data');
}
