class OldPswdModel {
  final String? email;
  final String? message;

  OldPswdModel({this.email, this.message});
  
  //body :password
  //headerName: Authorization:Bearer token 
  //header: token 


  //RETRUN:
  //email,
  // message for both success and failure

  factory OldPswdModel.fromJson(Map<String, dynamic> json) {
    return OldPswdModel(
      email: json['email']?.toString(),
      message: json['message']?.toString(),
    );
  }
}