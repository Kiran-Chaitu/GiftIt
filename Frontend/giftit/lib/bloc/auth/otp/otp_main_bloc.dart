import 'package:bloc/bloc.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/auth/otp_model.dart';
import 'package:equatable/equatable.dart';
import 'package:giftit/repository/authentication_repos/otp_repository.dart';

part 'otp_event.dart';
part 'opt_state.dart';

class OtpMainBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository otpRepository;

  OtpMainBloc({required this.otpRepository}) : super(const OtpState()) {
    on<OtpSubmitted>(_onOtpSubmitted);
  }

  void _onOtpSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
    emit(state.copyWith(otpApiResponse: const ApiResponse.loading()));

    try {
      final response = await otpRepository.verifyOtp({'otp': event.otp});
      emit(state.copyWith(otpApiResponse: ApiResponse.success(response)));
    } catch (e) {
      emit(state.copyWith(
        otpApiResponse: ApiResponse.failure("OTP Verification failed: ${e.toString()}"),
      ));
    }
  }
}
