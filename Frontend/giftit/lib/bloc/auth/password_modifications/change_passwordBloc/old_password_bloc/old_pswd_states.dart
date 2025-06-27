part of 'old_pswd_main_bloc.dart';

class OldPasswordState extends Equatable {
  final String oldPassword;
  final bool isPasswordVisible;
  final ApiResponse<OldPswdModel> oldPasswordResponse;

  const OldPasswordState({
    this.oldPassword = '',
    this.isPasswordVisible = false,
    this.oldPasswordResponse = const ApiResponse.initial(),
  });

  OldPasswordState copyWith({
    String? oldPassword,
    bool? isPasswordVisible,
    ApiResponse<OldPswdModel>? oldPasswordResponse,
  }) {
    return OldPasswordState(
      oldPassword: oldPassword ?? this.oldPassword,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      oldPasswordResponse: oldPasswordResponse ?? this.oldPasswordResponse,
    );
  }

  @override
  List<Object?> get props => [oldPassword, isPasswordVisible, oldPasswordResponse];
}
