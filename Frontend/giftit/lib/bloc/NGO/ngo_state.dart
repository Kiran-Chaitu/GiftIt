import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/response.dart';

import '../../models/ngo_model.dart';
class NgoState extends Equatable {
  final Status locationStatus;
  final ApiResponse<List<NGOModel>> nearByNgoApiResponse;
  final ApiResponse<List<NGOModel>> searchNgoApiResponse;

  const NgoState({
    this.locationStatus = Status.loading,
    this.nearByNgoApiResponse = const ApiResponse.loading(),
    this.searchNgoApiResponse = const ApiResponse.loading(),
  });

  NgoState copyWith({
    Status? locationStatus,
    ApiResponse<List<NGOModel>>? nearByNgoApiResponse,
    ApiResponse<List<NGOModel>>? searchNgoApiResponse,
  }) {
    return NgoState(
      locationStatus: locationStatus ?? this.locationStatus,
      nearByNgoApiResponse: nearByNgoApiResponse ?? this.nearByNgoApiResponse,
      searchNgoApiResponse: searchNgoApiResponse ?? this.searchNgoApiResponse,
    );
  }

  @override
  List<Object?> get props => [
        locationStatus,
        nearByNgoApiResponse,
        searchNgoApiResponse,
      ];
}
