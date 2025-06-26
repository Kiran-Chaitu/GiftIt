// part of 'login_main_bloc.dart';


// abstract class LoginEvent extends Equatable {
//   const LoginEvent();
//   @override
//   List<Object> get props=>[];
// }


// class EmailChanged extends LoginEvent {
//   const EmailChanged(this.email);
//   final String email;
//   @override
//   List<Object> get props=>[email];
// }

// class PasswordChanged extends LoginEvent {
//   const PasswordChanged(this.password);
//   final String password;
//   @override
//   List<Object> get props=>[password];
// }

// class LoginApi extends LoginEvent {}




part of 'login_main_bloc.dart';
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class TogglePasswordVisibility extends LoginEvent {}

class LoginApiCalled extends LoginEvent {}