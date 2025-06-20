// class UserModel {
//   final int id;
//   final double lat;
//   final double lon;
//   final String? name;
//   final String? address;
//   final String? district;
//   final String? state;
//   final String? postcode;
//   final String? socialFacilityType;
//   final String? socialFacilityFor;
//   double? distance;

//   UserModel({
//     required this.id,
//     required this.lat,
//     required this.lon,
//     this.name,
//     this.address,
//     this.district,
//     this.state,
//     this.postcode,
//     this.socialFacilityType,
//     this.socialFacilityFor,
//     this.distance, 
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     final tags = json['tags'] ?? {};
//     return UserModel(
//       id: json['id'],
//       lat: json['lat'],
//       lon: json['lon'],
//       name: tags['name'],
//       address: tags['addr:full'],
//       district: tags['addr:district'],
//       state: tags['addr:state'],
//       postcode: tags['addr:postcode'],
//       socialFacilityType: tags['social_facility'],
//       socialFacilityFor: tags['social_facility:for'],
//     );
//   }
// }

class UserModel {
  final String? token;
  final String? message;

  UserModel({this.token, this.message});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      message: json['message'],
    );
  } 
}
