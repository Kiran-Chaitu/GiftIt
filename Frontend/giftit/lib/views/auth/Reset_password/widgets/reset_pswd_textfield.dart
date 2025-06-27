import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/common_reset_pswd_bloc_floder/reset_pswd_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class ResetPasswordTextfield extends StatelessWidget {
  final String type;
  const ResetPasswordTextfield({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder< ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) {
        if (type == "New Password") {
          return previous.newPassword != current.newPassword ||
              previous.isNewPasswordVisible != current.isNewPasswordVisible;
        } else {
          return previous.confirmPassword != current.confirmPassword ||
              previous.isConfirmPasswordVisible != current.isConfirmPasswordVisible;
        }
      },
      builder: (context, state) {
        final isObscured = type == "New Password"
            ? !state.isNewPasswordVisible
            : !state.isConfirmPasswordVisible;

        return Container(
          height: size.height / 12,
          width: (size.width / 3) * 2.5,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextField(
            obscureText: isObscured,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: type,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  if (type == "New Password") {
                    context.read<ResetPasswordBloc>().add(ToggleNewPasswordVisibility());
                  } else {
                    context.read<ResetPasswordBloc>().add(ToggleConfirmPasswordVisibility());
                  }
                },
              ),
            ),
            onChanged: (val) {
              if (type == "New Password") {
                context.read<ResetPasswordBloc>().add(NewPasswordChanged(val));
              } else {
                context.read<ResetPasswordBloc>().add(ConfirmPasswordChanged(val));
              }
            },
          ),
        );
      },
    );
  }
}
