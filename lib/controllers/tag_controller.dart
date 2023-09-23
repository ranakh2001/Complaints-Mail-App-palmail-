import 'dart:convert';
import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../models/tag_model.dart';

Future<List<TagElement>> getAllTags(BuildContext context) async {
  final response = await http
      .get(Uri.parse(getTagsUrl), headers: {'Authorization': 'Bearer $token'});
  print(response.statusCode);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData =
        json.decode(response.body)['tags']; // Use 'tags' key
    List<TagElement> tags =
        jsonData.map((data) => TagElement.fromJson(data)).toList();
    return tags;
  }
  if (response.statusCode == 401) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NewInboxView()));
  } else if (response.statusCode == 500) {
    return Future.error('Internal server error (500) occurred');
  }
  return Future.error('Failed to load tags');
}

//
// Future<bool> addTag(TagElement newTag, BuildContext context) async {
//   final response = await http.post(
//     Uri.parse(addTagUrl),
//     headers: {'Authorization': 'Bearer $token'},
//     body: jsonEncode(newTag.toJson()),
//   );
//
//   if (response.statusCode == 200) {
//     return true;
//   }
//   if (response.statusCode == 401) {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => NewInboxView()));
//   } else if (response.statusCode == 500) {
//     return Future.error('Internal server error (500) occurred');
//   }
//   return false;
// }
Future<bool> addNewTag(BuildContext context, Map<String, dynamic> body) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // User user = userFromJson(prefs.getString('user')!);

  final response = await http.post(Uri.parse(addTagUrl),
      headers: {'Authorization': 'Bearer $token'}, body: body);

  if (response.statusCode == 200) {
    TagElement tag = TagElement.fromJson(body);

    return true;
  } else if (response.statusCode == 401) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NewInboxView(),
        ));
  }

  return Future.error('Something wrong');
}
