class EmailModel {
  final String? message;
  final String? token;

  EmailModel({this.message, this.token});

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      message: json['message']?.toString(),
      token: json['token']?.toString(),
    );
  }
}
