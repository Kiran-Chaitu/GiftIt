import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/auth/userModel.dart';
import 'package:giftit/utils/app_urls.dart';

class LoginRepository {
  final _api =NetworkApiServices();
  Future<UserModel> loginApi(dynamic data)async{
    final response = await _api.getApi(AppUrls.loginUrl("s;afk", "asfjkj"));
    return UserModel.fromJson(response);
  }
}