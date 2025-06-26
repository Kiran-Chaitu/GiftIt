part of 'old_pswd_main_bloc.dart';

abstract class OldPasswordEvent extends Equatable {
  const OldPasswordEvent();

  @override
  List<Object> get props => [];
}

class OldPasswordChanged extends OldPasswordEvent {
  final String oldPassword;
  const OldPasswordChanged(this.oldPassword);

  @override
  List<Object> get props => [oldPassword];
}

class OldPasswordVisibilityToggled extends OldPasswordEvent {}

class SubmitOldPassword extends OldPasswordEvent {}
