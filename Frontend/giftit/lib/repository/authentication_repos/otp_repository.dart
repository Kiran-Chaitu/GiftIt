import 'package:flutter/rendering.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/otp_model.dart';
import 'package:giftit/utils/app_urls.dart';

class OtpRepository {
  final _api = NetworkApiServices();

  Future<OtpModel> verifyOtp(dynamic data) async {
    debugPrint("OTP Data: $data");
    final response = await _api.postApi(AppUrls.otpUrl(), data);
    debugPrint("OTP Response: $response");
    return OtpModel.fromJson(response);
  }
}
