import 'package:giftit/utils/app_urls.dart';
import 'package:giftit/utils/tokens.dart';

class NgoModel {
  final String name;
  final double lat;
  final double lng;
  final String? photoUrl;
  final String vicinity;
  double distance;

  NgoModel({
    required this.name,
    required this.lat,
    required this.lng,
    required this.photoUrl,
    required this.vicinity,
    this.distance =0
  });

  factory NgoModel.fromJson(Map<String, dynamic> json) {
    final geometry = json['geometry'];
    final location = geometry?['location'];

    final photoList = json['photos'] as List<dynamic>?;
    String? photoReference;
    if (photoList != null && photoList.isNotEmpty) {
      photoReference = photoList[0]['photo_reference'];
    }

    return NgoModel(
      name: json['name'] ?? 'Unknown',
      lat: location?['lat'] ?? 0.0,
      lng: location?['lng'] ?? 0.0,
      photoUrl: photoReference != null
          ? '${AppUrls.googlePhotosUrl}$photoReference&key=${Tokens.googleApiKey}'
          : null,
      vicinity: json['vicinity'] ?? '',
    );
  }
}
