import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/Google_Map/google_map_event.dart';
import 'package:giftit/bloc/Google_Map/google_map_state.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/repository/google_maps_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  final GoogleMapsRepository repository;

  GoogleMapBloc({required this.repository}) : super(const GoogleMapState()) {
    on<LoadSelectedNgo>(_loadSelectedNgo);
    on<UpdateMapElements>(_updateMapElements);
  }

  Future<void> _loadSelectedNgo(
    LoadSelectedNgo event,
    Emitter<GoogleMapState> emit,
  ) async {
    emit(state.copyWith(selectedNgoApiResponse: const ApiResponse.loading(), isLoading: true));
    try {
      final currentPosition = await repository.getCurrentLocation();
      emit(state.copyWith(
        currentPosition: currentPosition,
        selectedNgoApiResponse: ApiResponse.success(event.selectedNgo),
      ));
    } catch (e) {
      emit(state.copyWith(
        selectedNgoApiResponse: ApiResponse.failure(e.toString()),
      ));
    }
  }

  Future<void> _updateMapElements(
    UpdateMapElements event,
    Emitter<GoogleMapState> emit,
  ) async {
    try {
      debugPrint("Triggered UpdateMapElements event...");
      final currentPosition = await repository.getCurrentLocation();
      final selectedNgo = state.selectedNgoApiResponse.data;

      if (currentPosition != null && selectedNgo != null) {
        final origin =
            LatLng(currentPosition.latitude, currentPosition.longitude);
        final destination = LatLng(selectedNgo.lat, selectedNgo.lng);

        debugPrint("Origin: $origin, Destination: $destination");

        final routePoints =
            await repository.getRoutePolyline(origin, destination);
        debugPrint("Received ${routePoints.length} polyline points");

        emit(state.copyWith(
          currentPosition: currentPosition,
          routePoints: routePoints,
          isLoading: false,
        ));
      } else {
        debugPrint("Current position or selected NGO is null.");
        emit(state.copyWith(
          isLoading: false,
          selectedNgoApiResponse: ApiResponse.failure("SomeThing went wrong! Please Reload the page."),
        ));
      }
    } catch (e) {
      debugPrint("Exception: $e");
      emit(state.copyWith(
        selectedNgoApiResponse: ApiResponse.failure(e.toString()),
      ));
    }
  }

}
