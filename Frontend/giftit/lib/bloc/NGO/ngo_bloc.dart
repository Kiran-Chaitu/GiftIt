import 'package:bloc/bloc.dart';
import 'package:giftit/bloc/NGO/ngo_event.dart';
import 'package:giftit/bloc/NGO/ngo_state.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/repository/ngo_repository.dart';
import 'package:giftit/utils/enums.dart';

class NgoBloc extends Bloc<NgoEvent, NgoState> {
  final NGORepository repository;
  NgoBloc({required this.repository}) : super(NgoState()) {
    on<LoadNearbyNgos>(_onFetchNearbyNgos);
    on<SearchSuggestions>(_onSearchSuggestions);
    on<SearchResults>(_onSearchResults);
    on<RevertToNearbyNgos>(_onRevertToNearbyNgos);
  }
  

void _onFetchNearbyNgos(LoadNearbyNgos event, Emitter<NgoState> emit) async {
    emit(state.copyWith(
      nearByNgoApiResponse: ApiResponse.loading(),
    ));
    try {
      final ngoResponse = await repository
          .fetchNearbyNGOs(); 
      emit(state.copyWith(
        
        nearByNgoApiResponse: ngoResponse,
      ));
    } 
    catch (e) {
      emit(state.copyWith(
        
        nearByNgoApiResponse: ApiResponse.failure(e.toString()),
      ));
    }
  }

  void _onSearchSuggestions(SearchSuggestions event , Emitter<NgoState> emit) async{
    emit(state.copyWith(
      searchStatus: SearchStatus.searching,
      searchSuggestionsApiResponse: ApiResponse.loading(),
    ));
    try {
      final searchSuggestionsResponse = await repository
          .fetchSearchSuggestions(event.input , state.nearByNgoApiResponse.data ?? []);
      emit(state.copyWith(
        searchSuggestionsApiResponse: searchSuggestionsResponse,
      ));
    } catch (e) {
      emit(state.copyWith(
        searchStatus: SearchStatus.failure,
        searchSuggestionsApiResponse: ApiResponse.failure(e.toString()),
      ));
    }
  }


  void _onSearchResults(SearchResults event, Emitter<NgoState> emit) {
    emit(state.copyWith(
      searchStatus: SearchStatus.success,
    ));
  }
  void _onRevertToNearbyNgos(RevertToNearbyNgos event, Emitter<NgoState> emit) {
    emit(state.copyWith(
      searchStatus: SearchStatus.initial,
    ));
  }
}
