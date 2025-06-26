//req body email and password

// return object
// token,status code //successs
// for non verified :403 and redirect to otp
// message for failure



// class UserModel {
//   final String? token;
//   final String? message;
//   final int? statusCode;

//   UserModel({this.token, this.message,this.statusCode});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       // token: json['token']?.toString(), 
//       token: json.containsKey('token') && json['token'] != null
//               ? json['token'].toString(): null,
//       message: json['message']?.toString(),
//       statusCode: json['statusCode'],
//     );
//   } 
// }


class UserModel {
  final String? token;
  final String? message;
  final int? statusCode; // 👈 fix: make it int

  UserModel({this.token, this.message, this.statusCode});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json.containsKey('jwtToken') && json['jwtToken'] != null
          ? json['jwtToken'].toString()
          : null,
      message: json['message']?.toString(),
      statusCode: json['statusCode'] is int
          ? json['statusCode']
          : int.tryParse(json['statusCode'].toString()),
    );
  }
}
