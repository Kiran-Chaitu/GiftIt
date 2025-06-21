import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrls {
  static final String ngosUrl = dotenv.env['NGOS_URL']!;



  static String getNgosUrl(double lat, double lon, double distanceKm) {
    double latOffset = distanceKm / 111;
    double lonOffset = distanceKm / (111 * cos(lat * (pi / 180)));
    double south = lat - latOffset;
    double north = lat + latOffset;
    double east = lon + lonOffset;
    double west = lon - lonOffset;

    return '$ngosUrl'
        '('
        'node["office"="charity"]($south,$west,$north,$east);'
        'node["social_facility"]($south,$west,$north,$east);'
        'node["non_profit"]($south,$west,$north,$east);'
        'node["charity"]($south,$west,$north,$east);'
        ');'
        'out body;';
  }
  static String loginUrl(){
    debugPrint("Login URL called");
    return "http://10.16.59.74:8080/auth-service/api/auth/login";
    
  }
  static String signupUrl(){
    return "http://10.16.59.74:8080/auth-service/api/auth/signup";
  } 
  static String otpUrl(){
    return "http://10.16.59.74:8080/auth-service/api/auth/signup";
  } 
}
