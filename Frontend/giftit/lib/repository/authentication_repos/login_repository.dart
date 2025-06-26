// import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/userModel.dart';
import 'package:giftit/utils/app_urls.dart';

class LoginRepository {
  final _api =NetworkApiServices();
  Future<UserModel> loginApi(dynamic data)async{
    debugPrint(data.toString());
    final response = await _api.postApi(AppUrls.loginUrl(), data);
    debugPrint(response.toString());
    return UserModel.fromJson(response);
  }
}