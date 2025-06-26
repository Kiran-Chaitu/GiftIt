part of 'otp_main_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class OtpSubmitted extends OtpEvent {
  final String otp,email,type;
  const OtpSubmitted(this.otp,this.email,this.type);

  @override
  List<Object> get props => [otp,email, type];
}

