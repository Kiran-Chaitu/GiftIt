import 'package:flutter/rendering.dart';
import 'package:giftit/utils/tokens.dart';

class AppUrls {
  static final String googlePhotosUrl =
      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=';

      static  final String getProfileUrl ='http://10.16.49.252:8080/profile-service/api/profile-details/user/';

      static final String editUserDataUrl='http://10.16.49.252:8080/profile-service/api/profile-details/user/update/';

  static String getDirectionsPolyLineUrl({
    required double originLatitude,
    required double originLongitude,
    required double destinationLatitude,
    required double destinationLongitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/directions/json'
        '?origin=$originLatitude,$originLongitude'
        '&destination=$destinationLatitude,$destinationLongitude'
        '&mode=driving'
        '&key=${Tokens.googleApiKey}';
  }
  

  static String getSearchSuggestionsApiUrl({
    required double latitude,
    required double longitude,
    required String keyword,
  }) {
    final encodedKeyword = Uri.encodeComponent("$keyword ngo");

    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        "?keyword=$encodedKeyword"
        "&location=$latitude,$longitude"
        "&radius=30000"
        "&key=${Tokens.googleApiKey}";
  }
  static String loginUrl(){
    debugPrint("Login URL called");
    return "http://10.16.59.74:8080/auth-service/api/auth/login";
  }


  static String getNearbyNGOApiUrl({
    required double latitude,
    required double longitude,
    int radius = 50000,
    String keyword = "NGO",
    String type = "point_of_interest",
  }) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        "?location=$latitude,$longitude"
        "&radius=$radius"
        "&keyword=$keyword"
        "&type=$type"
        "&key=${Tokens.googleApiKey}";
  }



  
  static String signupUrl(){
    return "http://10.16.59.74:8080/auth-service/api/auth/signup";
  } 
  static String otpUrl(){
    return "http://10.16.59.74:8080/auth-service/api/auth/signup";
  } 
}
