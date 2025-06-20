import 'package:giftit/utils/tokens.dart';

class AppUrls {
  static final String googlePhotosUrl =
      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=';

  static String getSerachSuggestionsApiUrl({
    required double latitude,
    required double longitude,
    required String keyword ,
    String type = "establishment",
  }) {
    return "https://maps.googleapis.com/maps/api/place/textsearch/json"
        "?query=$keyword ngo"
        "?location=$latitude,$longitude"
        "&type=$type"
        "&radius=300000"
        "&key=${Tokens.googleApiKey}";
  }

  

  static String getNearbyNGOApiUrl({
    required double latitude,
    required double longitude,
    int radius = 30000,
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



  static String loginUrl(String email,String password){
    return "afkj;asl";
  }
  static String signupUrl(String email,String password){
    return "afkj;asl";
  }
}
