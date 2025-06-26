class SignupModel {
  final String? userId;
  final String? email;
  final String? message;

  SignupModel({this.userId, this.email,this.message});

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      userId: json['userId'],
      email: json['email'],
      message: json['message'],
    );
  } 
}
