
class NgoSearchSuggestions {
  final String name;
  final double lat;
  final double lng;
  final String address;

  NgoSearchSuggestions(
      {required this.name,
      required this.lat,
      required this.lng,
      required this.address,});

  factory NgoSearchSuggestions.fromJson(Map<String, dynamic> json) {
    final geometry = json['geometry'];
    final location = geometry?['location'];

    return NgoSearchSuggestions(
      name: json['name'] ?? 'Unknown',
      lat: location?['lat'] ?? 0.0,
      lng: location?['lng'] ?? 0.0,
      address: json['formatted_address'] ?? '',
    );
  }
}
