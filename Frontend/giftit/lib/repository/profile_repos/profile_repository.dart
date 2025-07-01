import 'dart:io';
import 'package:flutter/material.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/profile/profileModell.dart';
import 'package:giftit/utils/app_urls.dart';

class ProfileRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<ApiResponse<ProfileModel>> fetchProfileData() async {
    try {
      dynamic response = await _apiServices.getApi(AppUrls.getProfileUrl);
      debugPrint("Response from profile API: $response");
    debugPrint('Response from profile API: ${response['response'].toString()}');
      if (response != null && response["response"] != null){
        final profile = ProfileModel.fromJson(response);
        debugPrint('Profile data fetched: ${profile.toString()}');
        return ApiResponse.success(profile);
      } else {
        return ApiResponse.failure("Invalid response format");
      }
    } catch (e) {
      debugPrint("Error fetching profile data: $e");
      return ApiResponse.failure(e.toString());
    }
  }

//    Future<ApiResponse<ProfileModel>> editProfileData(ProfileModel updatedProfile) async {
//     try {
//       final body = updatedProfile.toJson();
//       dynamic response = await _apiServices.postApi(
//         AppUrls.editUserDataUrl,
//         body,
//       );
//       debugPrint("Response from edit profile API: $response");
//
//       if (response != null && response["response"] != null) {
//         return ApiResponse.success(response);
//       } else {
//         throw Exception("Invalid response from server");
//       }
//     } catch (e) {
//       debugPrint("Error editing profile data: $e");
//       rethrow;
//     }
//   }
// }
  Future<ApiResponse> editProfileData(
  String name ,
  String number,
  String location,
   File image ,
      ) async {
    try {
      dynamic response = await _apiServices.putApiWithMultipart(
         AppUrls.editUserDataUrl, {
           'userName' :name,
         'userLocation':location,
        'userPhoneNumber':number,
      },
        'profileImage', image

      );
      debugPrint("Response from edit profile API: $response");
      if (response != null && response["response"] != null) {
        final profile = ProfileModel.fromJson(response["response"]);
        debugPrint('check : ${profile.toString()}');

        return ApiResponse.success(response);
      } else {
        return ApiResponse.failure("invalid response");
      }
    } catch (e) {
      debugPrint("Error editing profile data: $e");
      return ApiResponse.failure(e.toString());
    }
  }
}