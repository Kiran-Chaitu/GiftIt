class OtpModel {
  final String? token;
  final String? message;

  OtpModel({this.token, this.message});

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(

      //he is sending token as a message
      token: json['token']?.toString(),
      message: json['message']?.toString(),
    );
  }
}
