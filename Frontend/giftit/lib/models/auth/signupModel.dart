// class SignupModel {
//   // final String? userId;
//   // final String? email;
//   final String? message;
//   // final String? statusCode;
//    final int? statusCode; 

//   // SignupModel({this.userId, this.email,this.message});
//   SignupModel({this.statusCode,this.message});

//   factory SignupModel.fromJson(Map<String, dynamic> json) {
//     return SignupModel(
//       // statusCode: json.statusCode is int
//       //     ? json['statusCode']
//       //     : int.tryParse(json['statusCode'].toString()),
//       statusCode: json['statusCode'] is int
//           ? json['statusCode']
//           : int.tryParse(json['statusCode'].toString()),
//       message: json['message'],
//     );
//   } 
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
// userid as string 
// message for both success and failure
class SignupModel {
  final String? message;
  final int? statusCode;

  SignupModel({this.statusCode, this.message});

  factory SignupModel.fromJson(http.Response response) {
    try {
      final Map<String, dynamic> body = jsonDecode(response.body);

      return SignupModel(
        statusCode: response.statusCode, 
        message: body['message'],        
      );
    } catch (e) {
      return SignupModel(
        statusCode: response.statusCode,
        message: 'Error parsing response: ${e.toString()}',
      );
    }
  }
}
