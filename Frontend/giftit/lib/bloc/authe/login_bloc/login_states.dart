part of 'login_main_bloc.dart';
// part 'loginStatus.dart';
// class LoginState {
//   final String email;
//   final String password;
//   final bool isLoading;
//   final bool isSuccess;
//   final bool isFailure;

//   LoginState({
//     this.email = '',
//     this.password = '',
//     this.isLoading = false,
//     this.isSuccess = false,
//     this.isFailure = false,
//   });

//   LoginState updateStates({
//     String? email,
//     String? password,
//     bool? isLoading,
//     bool? isSuccess,
//     bool? isFailure,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       isLoading: isLoading ?? this.isLoading,
//       isSuccess: isSuccess ?? this.isSuccess,
//       isFailure: isFailure ?? this.isFailure,
//     );
//   }
// }


// part of 'login_main_bloc.dart';

class LoginState extends Equatable{
  final String email,password,message;
  final Loginstatus loginstatus; 
  const LoginState({
    this.email='',
    this.password='',
    this.loginstatus=Loginstatus.initial,
    this.message='',
  });
  //this will new instance of loginstate
  LoginState copyWith({
    String? email,
    String? password,
    Loginstatus? loginstatus,
    String? message,
  }){
    return LoginState(
      email: email??this.email,
      password: password ?? this.password,
      loginstatus: loginstatus ?? this.loginstatus,
      message:message ?? this.message,
    );
  }
  @override
  List<Object> get props=>[
      email, password,message,
      loginstatus,
    ];
}