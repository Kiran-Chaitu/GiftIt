// part of 'login_main_bloc.dart';
// enum LoginStatus { initial, loading, success, failure }

// class LoginState {
//   final String email;
//   final String password;
//   final bool isLoading;
//   final LoginStatus status;

//   LoginState({
//     this.email = '',
//     this.password = '',
//     this.isLoading = false,
//     this.status = LoginStatus.initial,
//   });

//   LoginState updateStates({
//     String? email,
//     String? password,
//     bool? isLoading,
//     LoginStatus? status,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       isLoading: isLoading ?? this.isLoading,
//       status: status ?? this.status,
//     );
//   }
// }


part of 'login_main_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  LoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  LoginState updateStates({
    String? email,
    String? password,
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
