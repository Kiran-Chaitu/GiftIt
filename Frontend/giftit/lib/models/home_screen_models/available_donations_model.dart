class AvailableDonationModel {
  final String id;
  final String imageUrl;
  final String name;
  final String item;
  final String address;
  final List<Map<String, dynamic>> items;

  AvailableDonationModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.item,
      required this.address,
      required this.items});

  factory AvailableDonationModel.fromJson(Map<String, dynamic> json) {
    return AvailableDonationModel(
        id: json['id'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        name: json['name'] ?? '',
        item: json['item'] ?? '',
        address: json['address'] ?? '',
        items: json['items'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'item': item,
      'address': address,
      'items': items,
    };
  }
}
