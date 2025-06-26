import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/models/profile/ngo_registration_Model.dart';

class NgoRegistrationState extends Equatable {
  final ApiResponse<NgoRegistrationModel> ngoRegistrationApiResponse;

  const NgoRegistrationState({
    this.ngoRegistrationApiResponse = const ApiResponse.loading(),
  });

  NgoRegistrationState copyWith({
    ApiResponse<NgoRegistrationModel>? ngoRegistrationApiResponse,
  }) {
    return NgoRegistrationState(
      ngoRegistrationApiResponse: ngoRegistrationApiResponse ?? this.ngoRegistrationApiResponse,
    );
  }

  @override
  List<Object> get props => [ngoRegistrationApiResponse];
}
