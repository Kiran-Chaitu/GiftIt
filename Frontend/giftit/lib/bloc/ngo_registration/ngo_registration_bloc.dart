import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/models/profile/ngo_registration_Model.dart';
import 'package:giftit/repository/profile_repos/ngoregistration_repositroy.dart';
import 'ngo_registration_event.dart';
import 'ngo_registration_state.dart';

Future<NgoRegistrationModel> registerNgo({
  required String ngoId,
  required String ngoName,
  required String ngoAddress,

}) async {

  await Future.delayed(Duration(seconds: 2));
  return NgoRegistrationModel(ngoId: ngoId, ngoName: ngoName, ngoAddress: ngoAddress);
}

class NgoRegistrationBloc extends Bloc<NgoRegistrationEvent, NgoRegistrationState> {
  NgoRegistrationBloc({required NgoRegistrationRepository repository}) : super(const NgoRegistrationState()) {
    on<SubmitNgoDetails>(_onSubmitNgoDetails);
  }

  Future<void> _onSubmitNgoDetails(
      SubmitNgoDetails event,
      Emitter<NgoRegistrationState> emit,
      ) async {
    emit(state.copyWith(
      ngoRegistrationApiResponse: const ApiResponse.loading(),
    ));

    try {

      final response = await registerNgo(
        ngoId: event.ngoId,
        ngoName: event.ngoName,
        ngoAddress: event.ngoAddress,
      );
      emit(state.copyWith(
        ngoRegistrationApiResponse: ApiResponse.success(response),
      ));
    } catch (e) {
      emit(state.copyWith(
        ngoRegistrationApiResponse: ApiResponse.failure(e.toString()),
      ));
    }
  }
}
