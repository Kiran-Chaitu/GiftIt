import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/data/Exceptions/app_exceptions.dart';
import 'package:giftit/models/auth/signupModel.dart';
import 'package:giftit/utils/app_urls.dart';

import 'package:http/http.dart' as http;

class SignupRepository {
  Future<ApiResponse<SignupModel>> signupApi(dynamic data,dynamic header) async {
    try {
      debugPrint("Signup API Request: $data");

      final response = await postApi(AppUrls.signupUrl(), data,header);
      debugPrint("Signup API Response: ${response.statusCode}");

      final signupModel = SignupModel.fromJson(response);

      if (signupModel.statusCode == 403 || signupModel.statusCode == 201) {
        // OTP required, treat as success so BLoC can handle navigation
        return ApiResponse.success(signupModel);
      } 
      // else if (signupModel.token != null && signupModel.token!.isNotEmpty) {
      //   // Signup success
      //   return ApiResponse.success(signupModel);
      // } 
      else {
        return ApiResponse.failure(signupModel.message ?? "Signup failed");
      }
    } catch (e) {
      return ApiResponse.failure("Error: ${e.toString()}");
    }
  }


Future<dynamic> postApi(String url, dynamic data,dynamic header) async {
    dynamic responseJson;
    try {
      debugPrint('Post API');
      final response = await http
          .post(Uri.parse(url),
              headers: header ?? {
                'Content-Type': 'application/json; charset=UTF-8',
              },
            body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      debugPrint('Response: ${response.body}');
      // debugPrint('Response: ${response.statusCode}');
      
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
      // responseJson['statusCode'] = statusCode;
      switch (statusCode) {
        case 200:
          // return responseJson;
          return response;
        case 201:
          // return responseJson;
          return response;
        case 400:
          throw BadRequestException(responseJson['message'] ?? 'Bad Request');
        case 401:
          throw UnauthorisedException(responseJson['message'] ?? 'Unauthorized');
        case 403:
          // return responseJson; 
          return response;
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
// Future<dynamic> postApi(String url, dynamic data, dynamic header) async {
//   try {
//     debugPrint('Post API');
//     final response = await http
//         .post(
//           Uri.parse(url),
//           headers: header ?? {
//             'Content-Type': 'application/json; charset=UTF-8',
//           },
//           body: jsonEncode(data),
//         )
//         .timeout(const Duration(seconds: 10));

//     debugPrint('Response: ${response.body}');
//     debugPrint('Response: ${response.statusCode}');

//     final responseJson = jsonDecode(response.body);

//     if (responseJson is Map<String, dynamic>) {
//       responseJson['statusCode'] = response.statusCode;
//     }

//     return returnResponseWithStatusCode(response, responseJson);
//   } on SocketException {
//     throw NoInternetException();
//   } on TimeoutException {
//     throw FetchDataException('Network Request Timed Out');
//   }
// }
// dynamic returnResponseWithStatusCode(http.Response response, dynamic responseJson) {
//   final statusCode = response.statusCode;

//   switch (statusCode) {
//     case 200:
//     case 201:
//     case 403:
//       return responseJson;
//     case 400:
//       throw BadRequestException(responseJson['message'] ?? 'Bad Request');
//     case 401:
//       throw UnauthorisedException(responseJson['message'] ?? 'Unauthorized');
//     case 500:
//       throw FetchDataException(responseJson['message'] ?? 'Server Error');
//     default:
//       throw FetchDataException(responseJson['message'] ?? 'Unexpected Error');
//   }
// }

}