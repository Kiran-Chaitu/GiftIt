import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/models/auth/reset_pswd_model.dart';
import 'package:giftit/repository/authentication_repos/reset_pswd_repo.dart';

part 'reset_pswd_events.dart';
part 'reset_pswd_states.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPswdRepo repository;

  ResetPasswordBloc({required this.repository}) : super(const ResetPasswordState()) {
    on<NewPasswordChanged>((event, emit) => emit(state.copyWith(newPassword: event.newPassword)));
    on<ConfirmPasswordChanged>((event, emit) => emit(state.copyWith(confirmPassword: event.confirmPassword)));
    on<ToggleNewPasswordVisibility>((event, emit) => emit(state.copyWith(isNewPasswordVisible: !state.isNewPasswordVisible)));
    on<ToggleConfirmPasswordVisibility>((event, emit) => emit(state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible)));
    on<SubmitResetPassword>(_handleSubmit);
  }

  Future<void> _handleSubmit(SubmitResetPassword event, Emitter<ResetPasswordState> emit) async {
    emit(state.copyWith(resetResponse: const ApiResponse.loading()));

    try {
      final data = {
        'email': event.email,
        'password': state.newPassword,
      };

      final model = await repository.resetPswdApi(data, null);
      emit(state.copyWith(resetResponse: ApiResponse.success(model)));
      await Future.delayed(const Duration(milliseconds: 200));
      emit(state.copyWith(resetResponse: ApiResponse.initial()));
    } catch (e) {
      emit(state.copyWith(resetResponse: ApiResponse.failure("Reset failed: ${e.toString()}")));
      await Future.delayed(const Duration(milliseconds: 200));
      emit(state.copyWith(resetResponse: ApiResponse.initial()));

    }
  }
}
