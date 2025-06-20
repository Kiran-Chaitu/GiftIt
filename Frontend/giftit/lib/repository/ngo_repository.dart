 import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/models/ngo_desc_model.dart';
import 'package:giftit/models/ngo_model.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/utils/app_urls.dart';
import 'package:giftit/utils/services/location_service.dart';
import 'package:giftit/utils/utils.dart';

class NGORepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<ApiResponse<List<NGOModel>>> fetchNearbyNGOs() async {
    final location = await LocationService.requestLocationPermission();
    double lat = location!.latitude!;
    double lon = location.longitude!;
    lat = 17.3850;
    lon = 78.4867;
    try {
      final String url = AppUrls.getNgosUrl(lat, lon, 20);

      final response = await _apiServices.getApi(url);

      final List<dynamic> elements = response['elements'] ?? [];
      final List<NGOModel> ngos = elements.map<NGOModel>((e) {
        final ngo = NGOModel.fromJson(e);
        ngo.distance = Utils.calculateDistance(lat, lon, ngo.lat, ngo.lon);
        
        return ngo;
      }).toList();
      ngos.sort((a, b) => a.distance!.compareTo(b.distance!));
      if (ngos.isEmpty) {
        return ApiResponse.failure("No nearby NGOs found!");
      } else {
        return ApiResponse.success(ngos);
      }
    } catch (e) {
      return ApiResponse.failure("Failed to fetch NGOs: ${e.toString()}");
    }
  }
  Future<ApiResponse<NgoDescModel>> ngoDescFetch() async {
    
    try {
      // final String url = AppUrls.getNgosUrl(lat, lon, 20);
      final String url = "sakjle.com";//neeDto be change

      final response = await _apiServices.getApi(url);

      final dynamic elements = response['elements'] ?? [];
      final NgoDescModel ngos = elements.map<NgoDescModel>((e) {
        final ngo = NgoDescModel.fromJson(e);
        // ngo.distance = Utils.calculateDistance(lat, lon, ngo.lat, ngo.lon);
        
        return ngo;
      }).toList();
      // if (ngos.isEmpty) {
      if (true==true) {
        return ApiResponse.failure("No nearby NGOs found!");
      } else {
        return ApiResponse.success(ngos);
      }
    } catch (e) {
      return ApiResponse.failure("Failed to fetch NGOs: ${e.toString()}");
    }
  }
}
