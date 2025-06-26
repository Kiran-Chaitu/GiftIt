// // part of 'signup_main_bloc.dart';

// // class SignupState extends Equatable{
// //   final String username,email,phoneNumber,password,cityLocation,message,conformpassword;
// //   final SignupStatus signupstatus; 
// //   const SignupState({
// //     this.username='',
// //     this.email='',
// //     this.phoneNumber='',
// //     this.cityLocation='',
// //     this.password='',
// //     this.conformpassword='',
// //     this.signupstatus=SignupStatus.initial,
// //     this.message='',
// //   });
// //   //this will new instance of SignupState
// //   SignupState copyWith({
// //     String? username,
// //     String? phoneNumber,
// //     String? email,
// //     String? password,
// //     String? conformpassword,
// //     String? cityLocation,
// //     SignupStatus? signupstatus,
// //     String? message,
// //   }){
// //     return SignupState(
// //       username: username??this.username,
// //       phoneNumber:phoneNumber??this.phoneNumber,
// //       email: email??this.email,
// //       cityLocation: cityLocation??this.cityLocation,
// //       password: password ?? this.password,
// //       signupstatus: signupstatus ?? this.signupstatus,
// //       message:message ?? this.message,
// //     );
// //   }
// //   @override
// //   List<Object> get props=>[
// //       username,email, phoneNumber,cityLocation,password,message,
// //       signupstatus,
// //     ];
// // }




// part of 'signup_main_bloc.dart';

// class SignupState extends Equatable {
//   final String username;
//   final String email;
//   final String phoneNumber;
//   final String cityLocation;
//   final String password;
//   final String confirmPassword;
//   final ApiResponse<SignupModel> signupApiResponse;

//   const SignupState({
//     this.username = '',
//     this.email = '',
//     this.phoneNumber = '',
//     this.cityLocation = '',
//     this.password = '',
//     this.confirmPassword = '',
//     this.signupApiResponse = const ApiResponse(Status.initial, null, null),
//   });

//   SignupState copyWith({
//     String? username,
//     String? email,
//     String? phoneNumber,
//     String? cityLocation,
//     String? password,
//     String? confirmPassword,
//     ApiResponse<SignupModel>? signupApiResponse,
//   }) {
//     return SignupState(
//       username: username ?? this.username,
//       email: email ?? this.email,
//       phoneNumber: phoneNumber ?? this.phoneNumber,
//       cityLocation: cityLocation ?? this.cityLocation,
//       password: password ?? this.password,
//       confirmPassword: confirmPassword ?? this.confirmPassword,
//       signupApiResponse: signupApiResponse ?? this.signupApiResponse,
//     );
//   }

//   @override
//   List<Object?> get props => [
//     username,
//     email,
//     phoneNumber,
//     cityLocation,
//     password,
//     confirmPassword,
//     signupApiResponse
//   ];
// }


part of 'signup_main_bloc.dart';
class SignupState extends Equatable {
  final String username;
  final String email;
  final String phoneNumber;
  final String cityLocation;
  final String password;
  final String confirmPassword;
  final ApiResponse<SignupModel> signupApiResponse;
  final bool obscurePassword;

  const SignupState({
    this.username = '',
    this.email = '',
    this.phoneNumber = '',
    this.cityLocation = '',
    this.password = '',
    this.confirmPassword = '',
    this.signupApiResponse = const ApiResponse(Status.initial, null, null),
    this.obscurePassword = true,
  });

  SignupState copyWith({
    String? username,
    String? email,
    String? phoneNumber,
    String? cityLocation,
    String? password,
    String? confirmPassword,
    ApiResponse<SignupModel>? signupApiResponse,
    bool? obscurePassword,
  }) {
    return SignupState(
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cityLocation: cityLocation ?? this.cityLocation,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      signupApiResponse: signupApiResponse ?? this.signupApiResponse,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  @override
  List<Object?> get props => [
    username,
    email,
    phoneNumber,
    cityLocation,
    password,
    confirmPassword,
    signupApiResponse,
    obscurePassword,
  ];
}
