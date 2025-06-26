import 'package:flutter/rendering.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/change_password/old_pswd_model.dart';
import 'package:giftit/utils/app_urls.dart';

class OldPswdForgetPswdRepository {
  final _api = NetworkApiServices();

  Future<OldPswdModel> verifyOldPswd(dynamic data,dynamic header) async {
    debugPrint("OTP Data: $data");
    final response = await _api.postApi(AppUrls.oldPswdUrl(), data,header);
    debugPrint("OTP Response: $response");
    return OldPswdModel.fromJson(response);
  }  
}