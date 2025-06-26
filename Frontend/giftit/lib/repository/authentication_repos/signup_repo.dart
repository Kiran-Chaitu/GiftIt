import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/signupModel.dart';
import 'package:giftit/utils/app_urls.dart';

class SignupRepository {
  final _api =NetworkApiServices();
  Future<SignupModel> singupApi(dynamic data)async{
    final response = await _api.postApi(AppUrls.signupUrl(),data);
    return SignupModel.fromJson(response);
  }
}