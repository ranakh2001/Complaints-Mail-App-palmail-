import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/user.dart';

Future<User?> login(Map<String, String> body) async {
  print('1');
  try {
    final response = await http.post(
      Uri.parse(loginUrl),
      body: body,
    );
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      print(response.body);
      return userFromJson(response.body);
    }else if (response.statusCode == 302) {
      String? redirectedUrl = response.headers['location'];
      if (kDebugMode) {
        print(redirectedUrl);
        print(response.body);
      }
    } else {
      throw Exception('Error with login ${response.body}');
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error during login: $e');
    }
    return null;
  }
  return null;
}

Future<User?> registerUser(String email, String password, String passwordCof, String name) async {
  final Map<String, dynamic> registrationData = {
    'email': email,
    'password': password,
    'password_confirmation': passwordCof,
    'name': name,
  };

  try {
    final response = await http.post(Uri.parse(registerUrl), body: registrationData);

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData.containsKey('user') && responseData.containsKey('token')) {
        final User user = userFromJson(json.encode(responseData['user']));
        user.token = responseData['token'];
        return user;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Please register first');
    }
  } catch (e) {
    print('Error during registration: $e');
    return null;
  }
}

Future<bool> logoutcon(String token) async {
  print('1');
  try {
    final response = await http.post(
      Uri.parse(logoutUrl),
      headers: {
        'Authorization': 'Bearer ${token}',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('3');
      return true;
    } else {
      throw Exception('Error with logout');
    }
  } catch (e) {
    print('Error during logout: $e');
    return false;
  }
}

