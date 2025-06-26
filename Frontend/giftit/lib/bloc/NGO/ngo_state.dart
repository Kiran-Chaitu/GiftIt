import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/ngo_models/ngo_model.dart';
import 'package:giftit/utils/enums.dart';

class NgoState extends Equatable {
  final SearchStatus searchStatus;
  final NgoModel? selectedNgo;
  final ApiResponse<List<NgoModel>> nearByNgoApiResponse;
  final ApiResponse<List<NgoModel>> searchSuggestionsApiResponse;

  const NgoState({
    this.searchStatus = SearchStatus.initial,
    this.selectedNgo,
    this.nearByNgoApiResponse = const ApiResponse.loading(),
    this.searchSuggestionsApiResponse = const ApiResponse.loading(),
  });

  NgoState copyWith({
    SearchStatus? searchStatus,
    NgoModel? selectedNgo,
    ApiResponse<List<NgoModel>>? nearByNgoApiResponse,
    ApiResponse<List<NgoModel>>? searchSuggestionsApiResponse,
  }) {
    return NgoState(
      searchStatus: searchStatus ?? this.searchStatus,
      selectedNgo: selectedNgo ?? this.selectedNgo,
      nearByNgoApiResponse: nearByNgoApiResponse ?? this.nearByNgoApiResponse,
      searchSuggestionsApiResponse:
          searchSuggestionsApiResponse ?? this.searchSuggestionsApiResponse,
    );
  }

  @override
  List<Object?> get props => [
        searchStatus,
        selectedNgo,
        nearByNgoApiResponse,
        searchSuggestionsApiResponse,
      ];
}
