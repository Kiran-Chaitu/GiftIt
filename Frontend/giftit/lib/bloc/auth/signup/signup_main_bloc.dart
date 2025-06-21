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

  void _onSignupApiCalled(SignupApiCalled event, Emitter<SignupState> emit) async {
    emit(state.copyWith(signupApiResponse: const ApiResponse.loading()));

    final data = {
      'username': state.username,
      'email': state.email,
      'phoneNumber': state.phoneNumber,
      'city': state.cityLocation,
      'password': state.password,
      // 'confirmPassword': state.confirmPassword,
    };

    try {
      final response = await signupRepository.singupApi(data);
      if (response.userId != null) {
        emit(state.copyWith(signupApiResponse: ApiResponse.success(response)));
      } else {
        emit(state.copyWith(signupApiResponse: const ApiResponse.failure("Signup failed")));
      }
    } catch (e) {
      emit(state.copyWith(signupApiResponse: ApiResponse.failure("Error: ${e.toString()}")));
    }
  }
}
