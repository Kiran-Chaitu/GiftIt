// part of 'login_main_bloc.dart';

// class LoginState extends Equatable{
//   final String email,password,message;
//   final Loginstatus loginstatus; 
//   const LoginState({
//     this.email='',
//     this.password='',
//     this.loginstatus=Loginstatus.initial,
//     this.message='',
//   });
//   //this will new instance of loginstate
//   LoginState copyWith({
//     String? email,
//     String? password,
//     Loginstatus? loginstatus,
//     String? message,
//   }){
//     return LoginState(
//       email: email??this.email,
//       password: password ?? this.password,
//       loginstatus: loginstatus ?? this.loginstatus,
//       message:message ?? this.message,
//     );
//   }
//   @override
//   List<Object> get props=>[
//       email, password,message,
//       loginstatus,
//     ];
// }
part of 'login_main_bloc.dart';
class LoginState extends Equatable {
  final String email;
  final String password;
  final ApiResponse<UserModel> loginApiResponse;

  const LoginState({
    this.email = '',
    this.password = '',
    this.loginApiResponse = const ApiResponse(Status.initial, null, null),
  });

  LoginState copyWith({
    String? email,
    String? password,
    ApiResponse<UserModel>? loginApiResponse,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loginApiResponse: loginApiResponse ?? this.loginApiResponse,
    );
  }

  @override
  List<Object?> get props => [email, password, loginApiResponse];
}
