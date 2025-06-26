// import 'package:bloc/bloc.dart';
// import 'package:giftit/data/API_Response/response.dart';
// import 'package:giftit/models/auth/otp_model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:giftit/repository/authentication_repos/otp_repository.dart';

// part 'otp_event.dart';
// part 'opt_state.dart';

// class OtpMainBloc extends Bloc<OtpEvent, OtpState> {
//   final OtpRepository otpRepository;

//   OtpMainBloc({required this.otpRepository}) : super(const OtpState()) {
//     on<OtpSubmitted>(_onOtpSubmitted);
//   }

//   void _onOtpSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
//     emit(state.copyWith(otpApiResponse: const ApiResponse.loading()));

//     try {
//       final response = await otpRepository.verifyOtp({'otp': event.otp});
//       emit(state.copyWith(otpApiResponse: ApiResponse.success(response)));
//        await Future.delayed(const Duration(milliseconds: 200));
//       emit(state.copyWith(otpApiResponse: ApiResponse.initial()));
//     } catch (e) {
//       emit(state.copyWith(
//         otpApiResponse: ApiResponse.failure("OTP Verification failed: ${e.toString()}"),
//       ));
//       await Future.delayed(const Duration(milliseconds: 200));
//       emit(state.copyWith(otpApiResponse: ApiResponse.initial()));
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/auth/otp_model.dart';
import 'package:giftit/repository/authentication_repos/otp_repository.dart';
import 'package:giftit/utils/secure_storage.dart';

part 'otp_event.dart';
part 'opt_state.dart';

class OtpMainBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository otpRepository;

  OtpMainBloc({required this.otpRepository}) : super(const OtpState()) {
    on<OtpSubmitted>(_onOtpSubmitted);
  }

  void _onOtpSubmitted(OtpSubmitted event, Emitter<OtpState> emit) async {
    emit(state.copyWith(otpApiResponse: const ApiResponse.loading()));

    final data = {'otp': event.otp,'email': event.email};

    final response = await otpRepository.verifyOtp(data,null,event.type);
    // if(response.status==Status.success && response.data?.message != null){
    //   await secureStorage.write(key: 'token', value: response.data!.message);
    //   debugPrint("token saved in otp aftersignupveification");
    // }
    emit(state.copyWith(otpApiResponse: response));

    await Future.delayed(const Duration(milliseconds: 200));
    emit(state.copyWith(otpApiResponse: ApiResponse.initial()));
  }
}