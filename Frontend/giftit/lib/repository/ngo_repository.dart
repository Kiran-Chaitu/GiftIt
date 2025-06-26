import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/models/ngo_models/ngo_desc_model.dart';
import 'package:giftit/models/ngo_models/ngo_model.dart';
import 'package:giftit/data/Network/network_api_services.dart';
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
      final String url =
          AppUrls.getNearbyNGOApiUrl(latitude: lat, longitude: lon);
          
      final response = await _apiServices.getApi(url);
      final elements = response['results'] as List<dynamic>;
      final List<NgoModel> ngos = elements.map<NgoModel>((e) {
        final ngo = NgoModel.fromJson(e);
        ngo.distance =
            (Geolocator.distanceBetween(lat, lon, ngo.lat, ngo.lng)) / 1000;
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

  Future<ApiResponse<List<NgoModel>>> fetchSearchSuggestions(
      String input, List<NgoModel> ngoList) async {
    try {
      final List<NgoModel> ngosSerachSuggestions = ngoList.where( (e) => e.name.toLowerCase().contains(input.toLowerCase()))
          .toList();

      if (ngosSerachSuggestions.isEmpty) {
        debugPrint("No NGOs found for the search input: $input");
        return ApiResponse.success(ngosSerachSuggestions);
      } else {
        return ApiResponse.success(ngosSerachSuggestions);
      }
    } catch (e) {
      debugPrint("Error fetching search suggestions: $e");
      return ApiResponse.failure("Failed to Fetch the search Results!");
    }
  }

  Future<ApiResponse<NgoDescModel>> ngoDescFetch() async {
    try {
      // final String url = AppUrls.getNgosUrl(lat, lon, 20);
      final String url = "sakjle.com"; //neeDto be change

      final response = await _apiServices.getApi(url);

      final dynamic elements = response['elements'] ?? [];
      final NgoDescModel ngos = elements.map<NgoDescModel>((e) {
        final ngo = NgoDescModel.fromJson(e);
        // ngo.distance = Utils.calculateDistance(lat, lon, ngo.lat, ngo.lon);

        return ngo;
      }).toList();
      // if (ngos.isEmpty) {
      if (true == true) {
        return ApiResponse.failure("No nearby NGOs found!");
      } else {
        return ApiResponse.success(ngos);
      }
    } catch (e) {
      return ApiResponse.failure("Failed to fetch NGOs: ${e.toString()}");
    }
  }
}
