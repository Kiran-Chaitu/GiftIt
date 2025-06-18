import 'package:bloc/bloc.dart';
import 'package:giftit/bloc/NGO/ngo_event.dart';
import 'package:giftit/bloc/NGO/ngo_state.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/repository/ngo_repository.dart';

class NgoBloc extends Bloc<NgoEvent, NgoState> {
  final NGORepository repository;
  NgoBloc({required this.repository}) : super(NgoState()) {
    on<LoadNearbyNgos>(_onFetchNearbyNgos);
  }

void _onFetchNearbyNgos(LoadNearbyNgos event, Emitter<NgoState> emit) async {
    emit(state.copyWith(locationStatus: Status.loading));
    try {
      final ngoResponse = await repository
          .fetchNearbyNGOs(); 
      emit(state.copyWith(
        locationStatus: Status.success,
        nearByNgoApiResponse: ngoResponse,
      ));
    } catch (e) {
      emit(state.copyWith(
        locationStatus: Status.failure,
        nearByNgoApiResponse: ApiResponse.failure(e.toString()),
      ));
    }
  }

}
