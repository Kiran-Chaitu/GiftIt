class NewpasswordModel {
  final String? email;
  final String message;

  NewpasswordModel({
    required this.message,
    this.email,
  });

  factory NewpasswordModel.fromJson(Map<String, dynamic> json) {
    return NewpasswordModel(
      email: json['email']?.toString(),
      message: json['message']?.toString() ?? 'No message',
    );
  }
}
