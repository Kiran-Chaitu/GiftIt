part of 'signup_main_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object> get props => [];
}

class PhoneNumberChanged extends SignupEvent {
  final String phoneNumber;
  const PhoneNumberChanged(this.phoneNumber);
  @override
  List<Object> get props => [phoneNumber];
}

class UsernameChanged extends SignupEvent {
  final String username;
  const UsernameChanged(this.username);
  @override
  List<Object> get props => [username];
}

class EmailChanged extends SignupEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object> get props => [email];
}

class CityLocationChanged extends SignupEvent {
  final String cityLocation;
  const CityLocationChanged(this.cityLocation);
  @override
  List<Object> get props => [cityLocation];
}

class PasswordChanged extends SignupEvent {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged(this.confirmPassword);
  @override
  List<Object> get props => [confirmPassword];
}


class PasswordVisibilityToggled extends SignupEvent {}


class SignupApiCalled extends SignupEvent {}
