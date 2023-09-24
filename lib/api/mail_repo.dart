import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:finalproject/core/helpers/api_base_helper.dart';
import 'package:finalproject/models/mail.dart';

import '../core/util/constants.dart';

class MailRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();


  // Future<void> newMail(Map<String, dynamic> body) async {
  //   final respons = await _helper.post(
  //       "/mails",
  //       {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       },
  //       body);

  //   print(respons);
  // }

  uploadImage(File image, int mailId) async {
    var request =
        http.MultipartRequest("POST", Uri.parse("$baseUrl/attachments"));
//create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath('image', image.path);
    request.fields['mail_id'] = mailId.toString();
    request.fields['title'] = 'image_${DateTime.now()}';
//add multipart to request
    request.files.add(pic);
    request.headers.addAll(
        {'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    var response = await request.send();

//Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    return response.statusCode;
  }

  Future<Mail> getSingleMail(String id) async {
    final rsponse = await _helper.get("/mails/$id", {
      'Authorization': 'Bearer $token',
    });
    return Mail.fromMap(rsponse['mail']);
  }

  deleteMail(String id) async {
    final response = await _helper.delete(
      "/mails/$id",
      {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response);
  }

  Future<Mail> updateMail(Map<String, dynamic> body, String id) async {
    final response = await _helper.put(
        "/mails/$id",
        {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body);
    print(response);
    return Mail.fromMap(response['mail']);
  }
}
