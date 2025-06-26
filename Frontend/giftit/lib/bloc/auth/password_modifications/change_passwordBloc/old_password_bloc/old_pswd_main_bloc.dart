import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/auth/change_password/old_pswd_model.dart';
import 'package:giftit/repository/authentication_repos/change_password/old_pswd_repo.dart';
import 'package:giftit/utils/secure_storage.dart';

part 'old_pswd_events.dart';
part 'old_pswd_states.dart';

class OldPasswordBloc extends Bloc<OldPasswordEvent, OldPasswordState> {
  final OldPswdForgetPswdRepository resetRepository;

  OldPasswordBloc({required this.resetRepository}) : super(const OldPasswordState()) {
    on<OldPasswordChanged>((event, emit) {
      emit(state.copyWith(oldPassword: event.oldPassword));
    });

    on<OldPasswordVisibilityToggled>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<SubmitOldPassword>((event, emit) async {
      emit(state.copyWith(oldPasswordResponse: const ApiResponse.loading()));
      try {

        String? token = await secureStorage.read(key: 'token');
        debugPrint("token from storage in oldpswd: $token");
        final headers = {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        };
        final body={
          'body':state.oldPassword
        };
        final result = await resetRepository.verifyOldPswd(body , headers);
        emit(state.copyWith(oldPasswordResponse: ApiResponse.success(result)));
      } catch (e) {
        emit(state.copyWith(oldPasswordResponse: ApiResponse.failure(e.toString())));
        await Future.delayed(const Duration(milliseconds: 200));
        emit(state.copyWith(oldPasswordResponse: const ApiResponse.initial()));
      }
    });
  }
}