class NgoRegistrationModel {
  final String ngoId;
  final String ngoName;
  final String ngoAddress;

  NgoRegistrationModel({
    required this.ngoId,
    required this.ngoName,
    required this.ngoAddress,
  });

  factory NgoRegistrationModel.fromJson(Map<String, dynamic> json) {
    return NgoRegistrationModel(
      ngoId: json['ngoId'],
      ngoName: json['ngoName'],
      ngoAddress: json['ngoAddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ngoId': ngoId,
      'ngoName': ngoName,
      'ngoAddress': ngoAddress,
    };
  }
}
