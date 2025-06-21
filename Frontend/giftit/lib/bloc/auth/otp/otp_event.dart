part of 'otp_main_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpSubmitted extends OtpEvent {
  final String otp;
  const OtpSubmitted(this.otp);

  @override
  List<Object> get props => [otp];
}
