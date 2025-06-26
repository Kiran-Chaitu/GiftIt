

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/data/Exceptions/app_exceptions.dart';
import 'package:giftit/models/auth/userModel.dart';
import 'package:giftit/utils/app_urls.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  // final _api =NetworkApiServices();
  // Future<ApiResponse<UserModel>> loginApi(dynamic data)async {
  //   try {
  //     debugPrint("Login API Request: $data");

  //     final response = await _api.postApi(AppUrls.loginUrl(), data);
  //     debugPrint("Login API Response: $response");

  //     final user = UserModel.fromJson(response);

  //     if (user.statusCode == 403) {
  //       return ApiResponse.success(user); // handle unverified in BLoC
  //     } else if (user.token != null && user.token!.isNotEmpty) {
  //       return ApiResponse.success(user); // success
  //     } else {
  //       return const ApiResponse.failure("Invalid credentials");
  //     }

  //   } catch (e) {
  //     return ApiResponse.failure("Error: ${e.toString()}");
  //   }
  // }

  Future<ApiResponse<UserModel>> loginApi(dynamic data) async {
    try {
      debugPrint("Login API Request: $data");

      final response = await postApi(AppUrls.loginUrl(), data);
      debugPrint("Login API Response: $response");

      final user = UserModel.fromJson(response);

      if (user.statusCode == 403) {
        return ApiResponse.success(user); 
      } else if (user.token != null && user.token!.isNotEmpty) {
        return ApiResponse.success(user); 
      } else {
        return  ApiResponse.failure(user.message??"Invalid credentials");
      }

    } catch (e) {
      return ApiResponse.failure("Error: ${e.toString()}");
    }
  }

}

Future<dynamic> postApi(String url, dynamic data) async {
    dynamic responseJson;
    try {
      debugPrint('Post API');
      final response = await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
              },
            body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      debugPrint('Response: ${response.body}');
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
        throw UnauthorisedException(responseJson['message'] ?? 'Unauthorized');
      case 403:
        return responseJson;
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
