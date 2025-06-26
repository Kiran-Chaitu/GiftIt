import 'dart:io';
import 'package:flutter/material.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/data/Network/network_api_services.dart';

import 'package:giftit/utils/app_urls.dart';

import '../../models/profile/ngo_registration_Model.dart';

class NgoRegistrationRepository {


  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<ApiResponse<NgoRegistrationModel>> NgoRegistrationData() async {


    try {
      dynamic response = await _apiServices.postApi(AppUrls.addNgoRegistrationUrl, data);
      debugPrint("Response from NgoRegistration API: $response");

      if (response != null && response["response"] != null) {
        final profile = NgoRegistrationModel.fromJson(response);
        return ApiResponse.success(profile);
      } else {
        return ApiResponse.failure("Invalid response format");
      }
    } catch (e) {
      debugPrint("Error Ngo Registration data: $e");
      return ApiResponse.failure(e.toString());
    }
  }
}
