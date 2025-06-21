import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/ngo_model.dart';
import 'package:giftit/models/ngo_search_suggestions.dart';
import 'package:giftit/utils/enums.dart';

class NgoState extends Equatable {
  final SearchStatus searchStatus;
  final ApiResponse<List<NgoModel>> nearByNgoApiResponse;
  final ApiResponse<List<NgoSearchSuggestions>> searchSuggestionsApiResponse;

  const NgoState({
    this.searchStatus = SearchStatus.initial,
    this.nearByNgoApiResponse = const ApiResponse.loading(),
    this.searchSuggestionsApiResponse = const ApiResponse.loading(),
  });

  NgoState copyWith({
    SearchStatus? searchStatus,
    ApiResponse<List<NgoModel>>? nearByNgoApiResponse,
    ApiResponse<List<NgoSearchSuggestions>>? searchSuggestionsApiResponse,
  }) {
    return NgoState(
      searchStatus: searchStatus ?? this.searchStatus,
      nearByNgoApiResponse: nearByNgoApiResponse ?? this.nearByNgoApiResponse,
      searchSuggestionsApiResponse: searchSuggestionsApiResponse ?? this.searchSuggestionsApiResponse,
    );
  }

  @override
  List<Object?> get props => [
        searchStatus,
        nearByNgoApiResponse,
        searchSuggestionsApiResponse,
      ];
}
