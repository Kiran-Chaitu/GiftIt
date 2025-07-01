part of 'reset_pswd_main_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
  @override
  List<Object?> get props => [];
}

class NewPasswordChanged extends ResetPasswordEvent {
  final String newPassword;
  const NewPasswordChanged(this.newPassword);
  @override
  List<Object?> get props => [newPassword];
}

class ConfirmPasswordChanged extends ResetPasswordEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged(this.confirmPassword);
  @override
  List<Object?> get props => [confirmPassword];
}

class ToggleNewPasswordVisibility extends ResetPasswordEvent {}

class ToggleConfirmPasswordVisibility extends ResetPasswordEvent {}

// class SubmitResetPassword extends ResetPasswordEvent {}

class SubmitResetPassword extends ResetPasswordEvent {
  final String email;
  const SubmitResetPassword(this.email);

  @override
  List<Object?> get props => [email];
}

