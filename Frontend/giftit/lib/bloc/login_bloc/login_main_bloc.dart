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


import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_events.dart';
part 'login_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>((event, emit) {
      // debugPrint(event.email);
      emit(state.updateStates(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      // debugPrint(event.password);
      emit(state.updateStates(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.updateStates(
        isLoading: true,
        isSuccess: false,
        isFailure: false,
      ));

      await Future.delayed(Duration(seconds: 2)); // Simulated API call

      if (state.email == 'giftit@gmail.com' && state.password == 'Giftit@123') {
        emit(state.updateStates(
          isLoading: false,
          isSuccess: true,
          isFailure: false,
        ));
      } else {
        emit(state.updateStates(
          isLoading: false,
          isSuccess: false,
          isFailure: true,
        ));
      }
    });
  }
}
