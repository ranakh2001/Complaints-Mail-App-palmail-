import 'dart:convert';
import 'package:finalproject/constants.dart';
import 'package:finalproject/screens/new%20inbox/new_inbox_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/category_model.dart'; // Import your CategoryModel

Future<List<CategoryElement>> getCategories(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // User user = userFromJson(prefs.getString('user')!);
  final response = await http.get(
    Uri.parse(getCategoriesUrl),
    // headers:{'Authorization': 'Bearer ${user.token}'})
  );

  if (response.statusCode == 200) {
    final categoryModel = CategoryModel.fromJson(json.decode(response.body));
    return categoryModel.categories!;
  }
  if (response.statusCode == 401) {
    final categoryModel = CategoryModel.fromJson(json.decode(response.body));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewInboxView()));
  }
  return Future.error('Failed to load categories');
}
