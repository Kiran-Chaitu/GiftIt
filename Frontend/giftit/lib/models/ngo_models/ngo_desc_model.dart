class NgoDescModel {
  final String? description;

  NgoDescModel({
    required this.description,
  });

  factory NgoDescModel.fromJson(Map<String, dynamic> json) {
    // final tags = json['tags'] ?? {};
    return NgoDescModel(
      description: json['description'],
    );
  }
}
