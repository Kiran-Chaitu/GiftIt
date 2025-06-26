// import 'package:flutter/rendering.dart';
// import 'package:giftit/data/Network/network_api_services.dart';
// import 'package:giftit/models/auth/otp_model.dart';
// import 'package:giftit/utils/app_urls.dart';

// class OtpRepository {
//   final _api = NetworkApiServices();

//   Future<OtpModel> verifyOtp(dynamic data) async {
//     debugPrint("OTP Data: $data");
//     final response = await _api.postApi(AppUrls.otpUrl(), data);
//     debugPrint("OTP Response: $response");
//     return OtpModel.fromJson(response);
//   }
// }


import 'package:flutter/rendering.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/otp_model.dart';
import 'package:giftit/utils/app_urls.dart';

class OtpRepository {
  final _api = NetworkApiServices();

  Future<ApiResponse<OtpModel>> verifyOtp(dynamic data,dynamic header,String type) async {
    try {
      debugPrint("OTP Data: $data");
      final response; 
      if(type=="authVerification")response= await _api.postApi(AppUrls.otpUrl(), data,header);
      // if(type=="authVerification")response= await _api.postApi(AppUrls.otpUrl(), data,header);
      else response = await _api.postApi(AppUrls.forgotOtpUrl(), data,header);
      debugPrint("OTP Response: $response");
      final otpModel = OtpModel.fromJson(response);
      return ApiResponse.success(otpModel);
    } catch (e) {
      return ApiResponse.failure("OTP Verification Failed: ${e.toString()}");
    }
  }
}
