// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'login_events.dart';
// part 'login_status.dart';


// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginState()) {
//     on<EmailChanged>((event, emit) {
//       emit(state.updateStates(email: event.email));
//     });
//     on<PasswordChanged>((event, emit) {
//       emit(state.updateStates(password: event.password));
//     });
//     on<LoginSubmitted>((event, emit) async {

//       emit(state.updateStates(isLoading: true, status: LoginStatus.initial));

//       await Future.delayed(Duration(seconds: 2)); // Simulate API call


//       if (state.email == 'gifit@gmail.com' && state.password == 'Giftit@123') {
//         emit(state.updateStates(isLoading: false, status: LoginStatus.success));
//       } else {
//         emit(state.updateStates(isLoading: false, status: LoginStatus.failure));
//       }
//     });
//   }
// }


import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/bloc/authe/login_bloc/loginStatus.dart';
import 'package:giftit/repository/authentication_repos/login_repository.dart';

part 'login_events.dart';
part 'login_states.dart';
part 'loginStatus.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginRepository loginRepository=LoginRepository();
  
  LoginBloc():super(const LoginState()){
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }
  void _onEmailChanged(EmailChanged event,Emitter<LoginState>emit){
    debugPrint(event.email);
    emit(
      state.copyWith(email:event.email),
    );
  }
  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState>emit){
    debugPrint(event.password);
    emit(
      state.copyWith(password:event.password),
    );
  }
  void _loginApi(LoginApi event,Emitter<LoginState>emit) async {
    Map data ={'email':state.email, "password":state.password};
    emit(state.copyWith(loginstatus: Loginstatus.loading));
    await loginRepository.loginApi(data).
      then((val){
        //success
        if(val.token !=null && val.token!.isNotEmpty){  
          emit(
            state.copyWith(
              loginstatus: Loginstatus.success,
              message:'Login Successful'
            ),
          );
        }
        else {//failure
          emit(
            state.copyWith(
              loginstatus: Loginstatus.fail,
              message: 'Invalid credentials',
            )
          );
        }
      });
  }
}



// import 'dart:async';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'login_events.dart';
// part 'login_states.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginState()) {
//     on<EmailChanged>((event, emit) {
//       // debugPrint(event.email);
//       emit(state.updateStates(email: event.email));
//     });

//     on<PasswordChanged>((event, emit) {
//       // debugPrint(event.password);
//       emit(state.updateStates(password: event.password));
//     });

//     on<LoginSubmitted>((event, emit) async {
//       emit(state.updateStates(
//         isLoading: true,
//         isSuccess: false,
//         isFailure: false,
//       ));

//       await Future.delayed(Duration(seconds: 2)); // Simulated API call

//       if (state.email == 'giftit@gmail.com' && state.password == 'Giftit@123') {
//         emit(state.updateStates(
//           isLoading: false,
//           isSuccess: true,
//           isFailure: false,
//         ));
//       } else {
//         emit(state.updateStates(
//           isLoading: false,
//           isSuccess: false,
//           isFailure: true,
//         ));
//       }
//     });
//   }
// }
