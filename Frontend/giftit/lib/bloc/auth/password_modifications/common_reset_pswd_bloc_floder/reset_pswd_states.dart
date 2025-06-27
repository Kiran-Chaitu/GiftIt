part of 'reset_pswd_main_bloc.dart';
class ResetPasswordState extends Equatable {
  final String newPassword;
  final String confirmPassword;
  final bool isNewPasswordVisible;
  final bool isConfirmPasswordVisible;
  final ApiResponse<NewpasswordModel> resetResponse;

  const ResetPasswordState({
    this.newPassword = '',
    this.confirmPassword = '',
    this.isNewPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.resetResponse = const ApiResponse.initial(),
  });

  ResetPasswordState copyWith({
    String? newPassword,
    String? confirmPassword,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
    ApiResponse<NewpasswordModel>? resetResponse,
  }) {
    return ResetPasswordState(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      resetResponse: resetResponse ?? this.resetResponse,
    );
  }

  @override
  List<Object?> get props => [
    newPassword,
    confirmPassword,
    isNewPasswordVisible,
    isConfirmPasswordVisible,
    resetResponse,
  ];
}
