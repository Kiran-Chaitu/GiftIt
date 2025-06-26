import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:giftit/data/Exceptions/app_exceptions.dart';
import 'package:giftit/data/Network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request Timed Out');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw FetchDataException('Network Request Timed Out');
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
