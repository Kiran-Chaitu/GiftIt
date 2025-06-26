import 'dart:convert';
import 'package:http/http.dart' as http;
 

class UserModel {
  final String? token;
  final String? message;
  final int? statusCode; 

  UserModel({this.token, this.message, this.statusCode});
  factory UserModel.fromJson(http.Response response) {
    try {
      final Map<String, dynamic> body = jsonDecode(response.body);

      return UserModel(
        token: body.containsKey('jwtToken') && body['jwtToken'] != null
            ? body['jwtToken'].toString()
            : null,
        statusCode: response.statusCode, 
        message: body['message'],        
      );
    } catch (e) {
        return UserModel(
          token: null,
          statusCode: response.statusCode,
          message: 'Error parsing response: ${e.toString()}',
        );
    }
  }
}
  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     token: json.containsKey('jwtToken') && json['jwtToken'] != null
  //         ? json['jwtToken'].toString()
  //         : null,
  //     message: json['message']?.toString(),
  //     statusCode: json['statusCode'] is int
  //         ? json['statusCode']
  //         : int.tryParse(json['statusCode'].toString()),
  //   );
  // }
// }
