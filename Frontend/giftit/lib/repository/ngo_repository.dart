import 'package:geolocator/geolocator.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/models/ngo_model.dart';
import 'package:giftit/data/Network/network_api_services.dart';
import 'package:giftit/models/ngo_search_suggestions.dart';
import 'package:giftit/utils/app_urls.dart';
import 'package:giftit/utils/services/location_service.dart';

class NGORepository {
  final NetworkApiServices _apiServices = NetworkApiServices();
  Future<ApiResponse<List<NgoModel>>> fetchNearbyNGOs() async {
    final location = await LocationService.requestLocationPermission();
    double lat = location!.latitude;
    double lon = location.longitude;
    // lat = 17.3850;
    // lon = 78.4867;
    try {
      final String url = AppUrls.getNearbyNGOApiUrl(latitude: lat, longitude: lon);
      final response = await _apiServices.getApi(url);

      final elements = response['results'] as List<dynamic>;
      final List<NgoModel> ngos = elements.map<NgoModel>((e) {
        final ngo = NgoModel.fromJson(e);
        ngo.distance = (Geolocator.distanceBetween(lat, lon, ngo.lat, ngo.lng))/1000;
        return ngo;
      }).toList();
      ngos.sort((a, b) {
        return a.distance.compareTo(b.distance);
      });
      if (ngos.isEmpty) {
        return ApiResponse.failure("No nearby NGOs found!");
      } else {
        return ApiResponse.success(ngos);
      }
    } catch (e) {
      return ApiResponse.failure("Failed to Fetch the NGOs!");
    }
  }

  Future<ApiResponse<List<NgoSearchSuggestions>>> fetchSearchSuggestions(String input) async {
    final location = await LocationService.requestLocationPermission();
    double lat = location!.latitude;
    double lon = location.longitude;
    // lat = 17.3850;
    // lon = 78.4867;
    try {
      final String url =
          AppUrls.getSerachSuggestionsApiUrl(
              latitude: lat, longitude: lon, keyword:input);
      final response = await _apiServices.getApi(url);

      final elements = response['results'] as List<dynamic>;
      final List<NgoSearchSuggestions> ngosSerachSuggestions = elements.map<NgoSearchSuggestions>((e) {
        final ngo = NgoSearchSuggestions.fromJson(e);
        return ngo;
      }).toList();
      
      if (ngosSerachSuggestions.isEmpty) {
        return ApiResponse.failure("No NGOs found!");
      } else {
        return ApiResponse.success(ngosSerachSuggestions);
      }
    } catch (e) {
      return ApiResponse.failure("Failed to Fetch the search Results!");
    }
  }


}
