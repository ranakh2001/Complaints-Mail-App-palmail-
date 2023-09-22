import 'dart:convert';
import 'dart:io';

import 'package:finalproject/core/util/constants.dart';
import 'package:http/http.dart' as http;

import 'app_exception.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url, Map<String, String> header) async {
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + url),
        headers: header,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      // intrnet error exception handlling
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(
      String url, Map<String, String> header, Map<String, dynamic> body) async {
    var responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: header,
        body: body,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      // intrnet error exception handlling
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(
      String url, Map<String, String> header, Map<String, dynamic> body) async {
    var responseJson;
    try {
      final response = await http.put(
        Uri.parse(baseUrl + url),
        headers: header,
        body: body,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      // intrnet error exception handlling
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(
      String url, Map<String, String> header,) async {
    var responseJson;
    try {
      final response = await http.delete(
        Uri.parse(baseUrl + url),
        headers: header,
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      // intrnet error exception handlling
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
