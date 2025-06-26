class DonationStatusModel {
  final String imageUrl;
  final String item;
  final String status;

  DonationStatusModel({
    required this.imageUrl,
    required this.item,
    required this.status,
  });

  factory DonationStatusModel.fromJson(Map<String, dynamic> json) {
    return DonationStatusModel(
      imageUrl: json['imageUrl'] ?? '',
      item: json['item'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'item': item,
      'status': status,
    };
  }
}
