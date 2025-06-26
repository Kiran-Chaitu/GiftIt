part of 'email_fp_main_bloc.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();
  @override
  List<Object?> get props => [];
}

class SubmitEmail extends EmailEvent {
  final String email;
  const SubmitEmail(this.email);

  @override
  List<Object?> get props => [email];
}
