class NGOModel {
  final int id;
  final double lat;
  final double lon;
  final String? name;
  final String? address;
  final String? district;
  final String? state;
  final String? postcode;
  final String? socialFacilityType;
  final String? socialFacilityFor;
  double? distance;

  NGOModel({
    required this.id,
    required this.lat,
    required this.lon,
    this.name,
    this.address,
    this.district,
    this.state,
    this.postcode,
    this.socialFacilityType,
    this.socialFacilityFor,
    this.distance, 
  });

  factory NGOModel.fromJson(Map<String, dynamic> json) {
    final tags = json['tags'] ?? {};
    return NGOModel(
      id: json['id'],
      lat: json['lat'],
      lon: json['lon'],
      name: tags['name'],
      address: tags['addr:full'],
      district: tags['addr:district'],
      state: tags['addr:state'],
      postcode: tags['addr:postcode'],
      socialFacilityType: tags['social_facility'],
      socialFacilityFor: tags['social_facility:for'],
    );
  }
}
