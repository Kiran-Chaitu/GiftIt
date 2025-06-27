import 'package:flutter/rendering.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/utils/app_urls.dart';

class EmailForgetPswdRepository {
  final _api = NetworkApiServices();

  Future<String> submitEmail(String email,dynamic header) async {
    debugPrint("Submitting email: $email");
    final response = await _api.postApi(AppUrls.emailForgetPswdUrl(), {"email": email}, header);
    debugPrint("Email submission response: $response");
    return response["message"]?.toString() ?? "null message";
  }
}