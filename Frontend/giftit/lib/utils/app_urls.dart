import 'package:flutter/rendering.dart';
import 'package:giftit/utils/tokens.dart';

class AppUrls {
  static final String googlePhotosUrl =
      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=';

      static  final String getProfileUrl ='http://10.16.61.254:8080/profile-service/api/profile-details/user/';

      static final String editUserDataUrl='http://10.16.61.254:8080/profile-service/api/profile-details/user/update/';

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





  static String DonationsStatusUrl() {
    return "http://10.16.61.254/donation-service/api/my-donations";
  }

  static String availableDonationsUrl() {
    return "http://10.16.61.254:8080/donation-service/api/available-donations";
  }

  static String claimDonationUrl() {
    return "http://10.16.61.254:8080/donation-service/api/claim-donation";
  }

  static String donationCountUrl() {
    return "http://10.16.49.93:8080/donation-service/api/claim-donation";
  }



 




  static String loginUrl(){
    debugPrint("Login URL called");
    return "http://10.16.49.93:8080/auth-service/api/auth/login";
    //req body email and password

    // return object
    // token,status code //successs
    // for non verified :403 and redirect to otp
    // message for failure
  }

  static String signupUrl(){
    return "http://10.16.49.93:8080/auth-service/api/auth/signup";
    //body : username , phonenumber, email, location , password

    
    // message for both success and failure
  } 
  static String otpUrl(){//otp verification  
     return "http://10.16.49.93:8080/auth-service/api/auth/otp/verification";
  }
  static String forgotOtpUrl(){ //validate otp
     return "http://10.16.49.93:8080/auth-service/api/auth/otp/validate";
     //email and otp
     
     //message for both success and failure
  } 
  static String resetPswdUrl(){
    return "http://10.16.49.93:8080/auth-service/api/auth/update/password";
    //req body : email, new password

    
    //response : email
    //message for fail
    
  } 
  //change password
  static String oldPswdUrl(){ //validate old password
    return "http://10.16.61.254/auth-service/api/auth/validate/password";
  //body :password
  //headerName: Authorization:Bearer token 
  //header: token 


  //RETRUN:
  //email,
  // message for both success and failure
  } 
  //forget password
  static String emailForgetPswdUrl(){
    return "http://10.16.61.254:8080/auth-service/api/auth/validate/email";
    // email
    // 
    // reponse:
    //message
  } 

}