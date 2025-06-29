import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/auth/signupModel.dart';

import 'package:giftit/repository/authentication_repos/signup_repo.dart';

part 'signup_events.dart';
part 'signup_states.dart';

class SignupMainBloc extends Bloc<SignupEvent, SignupState> {
  final SignupRepository signupRepository;

  SignupMainBloc({required this.signupRepository}) : super(const SignupState()) {
    on<UsernameChanged>(_onUsernameChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<EmailChanged>(_onEmailChanged);
    on<CityLocationChanged>(_onCityLocationChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);

    on<PasswordVisibilityToggled>(_onPasswordVisibilityToggled);

    on<SignupApiCalled>(_onSignupApiCalled);
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onPhoneNumberChanged(PhoneNumberChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onCityLocationChanged(CityLocationChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(cityLocation: event.cityLocation));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onConfirmPasswordChanged(ConfirmPasswordChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onPasswordVisibilityToggled(PasswordVisibilityToggled event, Emitter<SignupState> emit) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  // void _onSignupApiCalled(SignupApiCalled event, Emitter<SignupState> emit) async {
  //   emit(state.copyWith(signupApiResponse: const ApiResponse.loading()));

  //   final data = {
  //     'userName': state.username,
  //     'email': state.email,
  //     'userPhoneNumber': state.phoneNumber,
  //     'userLocation': state.cityLocation,
  //     'password': state.password,
  //     // 'confirmPassword': state.confirmPassword,
  //   };

  //   try {
  //     final response = await signupRepository.singupApi(data);
  //     // if (response.userId != null) {
  //     if (response.statusCode == "201") {
  //       emit(state.copyWith(signupApiResponse: ApiResponse.success(response)));
  //     } else {
  //       emit(state.copyWith(signupApiResponse: ApiResponse.failure(response.message ?? "Signup failed")));
  //       await Future.delayed(const Duration(milliseconds: 200));
  //       emit(state.copyWith(signupApiResponse: ApiResponse.initial()));
  //       // emit(state.copyWith(signupApiResponse: const ApiResponse.failure("Signup failed")));
  //     }
  //   } catch (e) {
  //       emit(state.copyWith(signupApiResponse: ApiResponse.failure("Error: ${e.toString()}")));      
  //       await Future.delayed(const Duration(milliseconds: 200));
  //       emit(state.copyWith(signupApiResponse: ApiResponse.initial()));
  //   }
  // }
  void _onSignupApiCalled(SignupApiCalled event, Emitter<SignupState> emit) async {
    emit(state.copyWith(signupApiResponse: const ApiResponse.loading()));

    final data = {
      'userName': state.username,
      'email': state.email,
      'userPhoneNumber': state.phoneNumber,
      'userLocation': state.cityLocation,
      'password': state.password,
    };

    try {
      final apiResponse = await signupRepository.signupApi(data,null);

      if (apiResponse.status == Status.success) {
        final signupModel = apiResponse.data;

        if (signupModel != null && signupModel.statusCode == 403) {
          // User needs OTP verification
          emit(state.copyWith(signupApiResponse: ApiResponse.success(signupModel)));
          // Navigation to OTP screen should happen in the UI using BlocListener when state.signupApiResponse.data.statusCode == 403
        } else if (signupModel != null && signupModel.statusCode == 201) {
          // Signup success
          
          emit(state.copyWith(signupApiResponse: ApiResponse.success(signupModel)));
        } else {
          emit(state.copyWith(signupApiResponse: ApiResponse.failure(signupModel?.message ?? "Signup failed")));
          await Future.delayed(const Duration(milliseconds: 200));
          emit(state.copyWith(signupApiResponse: const ApiResponse.initial()));
        }

      } else {
        emit(state.copyWith(signupApiResponse: ApiResponse.failure(apiResponse.message ?? "Signup failed")));
        // await Future.delayed(const Duration(milliseconds: 200));
        // emit(state.copyWith(signupApiResponse: const ApiResponse.initial()));
      }

    } catch (e) {
      emit(state.copyWith(signupApiResponse: ApiResponse.failure("Error: ${e.toString()}")));
      // await Future.delayed(const Duration(milliseconds: 200));
      // emit(state.copyWith(signupApiResponse: const ApiResponse.initial()));
    }
}


}



