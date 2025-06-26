// import 'package:flutter/rendering.dart';
// import 'package:giftit/data/Network/network_api_services.dart';
// import 'package:giftit/models/auth/change_password/old_pswd_model.dart';
// import 'package:giftit/utils/app_urls.dart';

// class OldPswdForgetPswdRepository {
//   final _api = NetworkApiServices();

//   Future<OldPswdModel> verifyOldPswd(dynamic data,dynamic header) async {
//     debugPrint("OTP Data: $data");
//     final response = await _api.postApi(AppUrls.oldPswdUrl(), data,header);
//     debugPrint("OTP Response: $response");
//     return OldPswdModel.fromJson(response);
//   }  
// }

import 'package:flutter/foundation.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/change_password/old_pswd_model.dart';
import 'package:giftit/utils/app_urls.dart';

class OldPswdForgetPswdRepository {
  final _api = NetworkApiServices();

  Future<ApiResponse<OldPswdModel>> verifyOldPswd(dynamic data, dynamic headers) async {
    try {
      debugPrint("Old Password Data: $data");
      debugPrint("Old Password Headers: $headers");

      final response = await _api.postApi(AppUrls.oldPswdUrl(), data, headers);
      debugPrint("Old Password API Response: $response");

      final oldPswdModel = OldPswdModel.fromJson(response ?? {});
      return ApiResponse.success(oldPswdModel);
    } 
    catch (e) {
      debugPrint("Old Password Verification Error: $e");
      return ApiResponse.failure("Old Password Verification Failed: ${e.toString()}");
    }
  }
}
            