part of 'otp_main_bloc.dart';



class OtpState extends Equatable {
  final ApiResponse<OtpModel> otpApiResponse;

  const OtpState({this.otpApiResponse = const ApiResponse.initial()});

  OtpState copyWith({
    ApiResponse<OtpModel>? otpApiResponse,
  }) {
    return OtpState(
      otpApiResponse: otpApiResponse ?? this.otpApiResponse,
    );
  }

  @override
  List<Object?> get props => [otpApiResponse];
}
