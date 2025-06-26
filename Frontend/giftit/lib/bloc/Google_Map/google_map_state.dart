import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/ngo_models/ngo_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapState extends Equatable {
  final Position? currentPosition;
  final List<LatLng> routePoints;

  final ApiResponse<NgoModel> selectedNgoApiResponse;

  const GoogleMapState({
    this.currentPosition,
    this.routePoints = const [],
    this.selectedNgoApiResponse = const ApiResponse.loading(),
  });

  GoogleMapState copyWith({
  Position? currentPosition,
    ApiResponse<NgoModel>? selectedNgoApiResponse,
    List<LatLng>? routePoints,
  }) {
    return GoogleMapState(
      currentPosition: currentPosition ?? this.currentPosition,
      routePoints: routePoints ?? this.routePoints,
      selectedNgoApiResponse: selectedNgoApiResponse ?? this.selectedNgoApiResponse,
    );
  }

  @override
  List<Object?> get props => [currentPosition, selectedNgoApiResponse, routePoints];

}
