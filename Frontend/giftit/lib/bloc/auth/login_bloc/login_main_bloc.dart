

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
import 'package:flutter/widgets.dart';
import 'package:giftit/data/API_Response/response.dart';
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
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginApiCalled(LoginApiCalled event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginApiResponse: const ApiResponse.loading()));

    final data = {
      'email': state.email,          
      'password': state.password
    };

    try {
      final response = await loginRepository.loginApi(data);
      debugPrint(response.toString());
      if (response.token != null && response.token!.isNotEmpty) {
        emit(state.copyWith(
          // loginApiResponse: const ApiResponse.success({token:,message:"Login Successful"),
          loginApiResponse: ApiResponse.success(response),
        ));
      } else {
        emit(state.copyWith(
          loginApiResponse: const ApiResponse.failure("Invalid credentials"),
        ));
        // emit(state.copyWith(
        //   loginApiResponse: ApiResponse.initial(),
        // ));
      }
    } catch (e) {           
      emit(state.copyWith(
        loginApiResponse: ApiResponse.failure("Login failed: ${e.toString()}"),
      ));
      // emit(state.copyWith(
      //   loginApiResponse: ApiResponse.initial(),
      // ));
    }
  }
}
