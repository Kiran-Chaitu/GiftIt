import 'package:flutter/foundation.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/reset_pswd_model.dart';
import 'package:giftit/utils/app_urls.dart';

class ResetPswdRepo {
  final _api = NetworkApiServices();

  Future<NewpasswordModel> resetPswdApi(dynamic data, dynamic header) async {
    try {
      final response = await _api.postApi(AppUrls.resetPswdUrl(), data, header);
      debugPrint("Reset Password Response: $response");

      if (response == null || response.toString().isEmpty) {
        return NewpasswordModel(message: "Empty response from server", email: null);
      }

      return NewpasswordModel.fromJson(response);
    } catch (e) {
      debugPrint("Reset Password Error: ${e.toString()}");
      return NewpasswordModel(message: "Reset failed: ${e.toString()}", email: null);
    }
  }
}
