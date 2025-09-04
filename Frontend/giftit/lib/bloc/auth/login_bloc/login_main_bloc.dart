

// import 'package:equatable/equatable.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:giftit/bloc/authe/login_bloc/loginStatus.dart';
// import 'package:giftit/repository/authentication_repos/login_repository.dart';

// part 'login_events.dart';
// part 'login_states.dart';
// part 'loginStatus.dart';

// class LoginBloc extends Bloc<LoginEvent,LoginState>{
//   LoginRepository loginRepository=LoginRepository();
  
//   LoginBloc():super(const LoginState()){
//     on<EmailChanged>(_onEmailChanged);
//     on<PasswordChanged>(_onPasswordChanged);
//     on<LoginApi>(_loginApi);
//   }
//   void _onEmailChanged(EmailChanged event,Emitter<LoginState>emit){
//     debugPrint(event.email);
//     emit(
//       state.copyWith(email:event.email),
//     );
//   }
//   void _onPasswordChanged(PasswordChanged event, Emitter<LoginState>emit){
//     debugPrint(event.password);
//     emit(
//       state.copyWith(password:event.password),
//     );
//   }
//   void _loginApi(LoginApi event,Emitter<LoginState>emit) async {
//     Map data ={'email':state.email, "password":state.password};
//     emit(state.copyWith(loginstatus: Loginstatus.loading));
//     await loginRepository.loginApi(data).
//       then((val){
//         //success
//         if(val.token !=null && val.token!.isNotEmpty){  
//           emit(
//             state.copyWith(
//               loginstatus: Loginstatus.success,
//               message:'Login Successful'
//             ),
//           );
//         }
//         else {//failure
//           emit(
//             state.copyWith(
//               loginstatus: Loginstatus.fail,
//               message: 'Invalid credentials',
//             )
//           );
//         }
//       });
//   }
// }


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/data/Exceptions/app_exceptions.dart';
import 'package:giftit/data/Local%20Storage/secure_storage.dart';
import 'package:giftit/models/auth/userModel.dart';
import 'package:giftit/repository/authentication_repos/login_repository.dart';


 part 'login_events.dart';
 part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApiCalled>(_onLoginApiCalled);
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  // void _onLoginApiCalled(LoginApiCalled event, Emitter<LoginState> emit) async {
  //   emit(state.copyWith(loginApiResponse: const ApiResponse.loading()));

  //   final data = {
  //     'email': state.email,          
  //     'password': state.password
  //   };
  //   try {
  //     final response = await loginRepository.loginApi(data);
  //     // debugPrint("jsfjsahreponse check");
  //     // // debugPrint("Login response: ${response.statusCode}\n ${response.statusCode == 403}");

  //     // if (response.statusCode.toString() == "403") {
  //     //   debugPrint("statuscode match 403");
  //     //   emit(state.copyWith(
  //     //     loginApiResponse: ApiResponse.success(response), // still success, but handle via statusCode
  //     //   ));
  //     // } else
  //      if (response.token != null && response.token!.isNotEmpty) {
  //       emit(state.copyWith(
  //         loginApiResponse: ApiResponse.success(response),
  //       ));
  //     } else {
  //       emit(state.copyWith(
  //         loginApiResponse: const ApiResponse.failure("Invalid credentials"),
  //       ));
  //     }
  //     await Future.delayed(const Duration(milliseconds: 200));
  //     emit(state.copyWith(loginApiResponse: ApiResponse.initial()));
  //   } 
  //   catch (e) {
  //     debugPrint((e is UnauthorisedException) ? "I am in the catch" : "Other exception caught");
  //     if (e is UnauthorisedException &&
  //         e.toString().toLowerCase().contains("unverified")) {
  //       emit(state.copyWith(
  //         loginApiResponse: ApiResponse.success(UserModel(
  //           statusCode: 403,
  //           message: "Unverified user",
  //         )),
  //       ));
  //       return; // Early return if unverified
  //     } 
  //     emit(state.copyWith(
  //       loginApiResponse: ApiResponse.failure("Login failed: ${e.toString()}"),
  //     ));
  //     await Future.delayed(const Duration(milliseconds: 200));
  //     emit(state.copyWith(loginApiResponse: ApiResponse.initial()));
  //   }

  //   // try {
  //   //   final response = await loginRepository.loginApi(data);
  //   //   debugPrint(response.toString());
      
  //   //   if ((response.statusCode==403) || (response.token != null && response.token!.isNotEmpty)) {
  //   //     emit(state.copyWith(
  //   //       // loginApiResponse: const ApiResponse.success({token:,message:"Login Successful"),
  //   //       loginApiResponse: ApiResponse.success(response),
  //   //     ));
  //   //   } else {
  //   //     emit(state.copyWith(
  //   //       loginApiResponse: const ApiResponse.failure("Invalid credentials"),
  //   //     ));
  //   //      await Future.delayed(const Duration(milliseconds: 200));
  //   //     emit(state.copyWith(
  //   //       loginApiResponse: ApiResponse.initial(),
  //   //     ));
  //   //   }
  //   // } catch (e) {           
  //   //   emit(state.copyWith(
  //   //     loginApiResponse: ApiResponse.failure("Login failed: ${e.toString()}"),
  //   //   ));
  //   //    await Future.delayed(const Duration(milliseconds: 200));
  //   //   emit(state.copyWith(
  //   //     loginApiResponse: ApiResponse.initial(),
  //   //   ));
  //   // }
  // }

  void _onLoginApiCalled(LoginApiCalled event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginApiResponse: const ApiResponse.loading()));

    final data = {
      'email': state.email.trim(),
      'password': state.password.trim()
    };
    try {
      final response = await loginRepository.loginApi(data);
      debugPrint("Login success: ${response.data?.statusCode}");
      if (response.data?.statusCode == 403) {
        emit(state.copyWith(
          loginApiResponse: ApiResponse.success(response.data!),
        ));
      } 
      else if (response.data?.token != null) {
          //  adding the token to secure storage
          await SecureStorage().write(key: 'token', value: response.data!.token!);
          debugPrint("Token saved in secure storage Login: ${response.data!.token}");

        emit(state.copyWith(
          loginApiResponse: ApiResponse.success(response.data),
        ));
      } else {
        emit(state.copyWith(
          loginApiResponse: ApiResponse.failure(response.data?.message ?? "Invalid credentials"),  
        ));
      }
      // await Future.delayed(const Duration(milliseconds: 200));
      emit(state.copyWith(loginApiResponse: ApiResponse.initial()));
    } catch (e) {
      debugPrint(e.toString());
      if (e is UnauthorisedException && e.toString().toLowerCase().contains("unverified")) {
        emit(state.copyWith(
          loginApiResponse: ApiResponse.success(UserModel(
            statusCode: 403,
            message: "Unverified user",
          )),
        ));
        emit(state.copyWith(loginApiResponse: ApiResponse.initial()));
        return; // Early return if unverified
      }
      emit(state.copyWith(
        loginApiResponse: ApiResponse.failure("Login failed: ${e.toString()}"),
      ));
      // await Future.delayed(const Duration(milliseconds: 200));
      emit(state.copyWith(loginApiResponse: ApiResponse.initial()));
    }
  }
}
