part of 'signup_main_bloc.dart';


abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object> get props=>[];
}

class PhoneNumberChanged extends SignupEvent {
  const PhoneNumberChanged(this.phoneNumber);
  final String phoneNumber;
  @override
  List<Object> get props=>[phoneNumber];
}
class UsernameChanged extends SignupEvent {
  const UsernameChanged(this.username);
  final String username;
  @override
  List<Object> get props=>[username];
}

class EmailChanged extends SignupEvent {
  const EmailChanged(this.email);
  final String email;
  @override
  List<Object> get props=>[email];
}

class CityLocationChanged extends SignupEvent {
  const CityLocationChanged(this.cityLocation);
  final String cityLocation;
  @override
  List<Object> get props=>[cityLocation];
}
class PasswordChanged extends SignupEvent {
  const PasswordChanged(this.password);
  final String password;
  @override
  List<Object> get props=>[password];
}
class ConfirmPasswordchanged extends SignupEvent {
  const ConfirmPasswordchanged(this.conformpassword);
  final String conformpassword;
  @override
  List<Object> get props=>[conformpassword];
}




class SignupApi extends SignupEvent {}