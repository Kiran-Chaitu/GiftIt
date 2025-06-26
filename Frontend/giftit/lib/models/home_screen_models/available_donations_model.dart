class AvailableDonationModel {
  final String id;
  final String imageUrl;
  final String name;
  final String item;
  final String address;

  AvailableDonationModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.item,
    required this.address,
  });

  factory AvailableDonationModel.fromJson(Map<String, dynamic> json) {
    return AvailableDonationModel(
      id: json['id'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
      item: json['item'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'item': item,
      'address': address,
    };
  }
}
