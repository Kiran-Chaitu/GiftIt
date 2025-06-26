import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:giftit/data/Exceptions/app_exceptions.dart';
import 'package:giftit/data/Network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url),
          headers: {

            'Content-Type': 'application/json',
            "Authorization":"Bearer eyJhbGciOiJIUzUxMiJ9.eyJ1c2VySWQiOjEsInN1YiI6IjEiLCJpYXQiOjE3NTA2MDc4NzIsImV4cCI6MTc1MzE5OTg3Mn0.Do846AqLgK-xYRPopS18hWFtxRCkE7eUSrHXy51RosgKicnUgcUeQEXdL9nksUimGHDVtpUyjfNHrdtCr9visA"
          },
          ).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
      // debugPrint('Response: ${response.body}');
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request Timed Out');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    debugPrint('Post API');
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
              },
            body: jsonEncode(data))
          .timeout(const Duration(seconds: 15));
      debugPrint('Response: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request Timed Out');
    }
    return responseJson;
  }


  @override
  Future<dynamic> putApi(String url, dynamic data) async {
    debugPrint('Put API');
    dynamic responseJson;
    try {
      final response = await http
          .put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: 20));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request Timed Out');
    }
    return responseJson;
  }

  @override
  Future<dynamic> putApiWithMultipart(
     String url,
     Map<String, String> fields,
     String fileFieldName,
     File file,
  ) async {
    debugPrint('PUT API with Multipart (Single File)');

    var uri = Uri.parse(url);
    var request = http.MultipartRequest('PUT', uri);

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });

    request.fields.addAll(fields);

    request.files.add(
      await http.MultipartFile.fromPath(
        fileFieldName,
        file.path,
      ),
    );

    dynamic responseJson;
    try {
      final streamedResponse =

      await request.send().timeout(const Duration(seconds: 20));

      final response = await http.Response.fromStream(streamedResponse);

      debugPrint('PUT Multipart Response: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request Timed Out');
    } catch (e) {
      throw FetchDataException('Unexpected Error: ${e.toString()}');
    }

    return responseJson;
  }


  dynamic returnResponse(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = response.body;
    try {
      final responseJson = jsonDecode(responseBody);
      switch (statusCode) {
        case 200:
          return responseJson;
        case 400:
          throw BadRequestException(responseJson['message'] ?? 'Bad Request');
        case 401:
          throw UnauthorisedException(
              responseJson['message'] ?? 'Unauthorized');
        case 403:
          throw UnauthorisedException(responseJson['message'] ?? 'Forbidden');
        case 500:
          throw FetchDataException(responseJson['message'] ?? 'Server Error');
        default:
          throw FetchDataException(
              responseJson['message'] ?? 'Unexpected Error Occurred');
      }
    } catch (e) {
      throw FetchDataException(
          'Error parsing response: $responseBody\nError: ${e.toString()}');
    }
  }

}
