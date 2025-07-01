import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/bloc/auth/old_password/old_password_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/change_passwordBloc/old_password_bloc/old_pswd_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class OldPasswordTextField extends StatelessWidget {
  const OldPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<OldPasswordBloc, OldPasswordState>(
      builder: (context, state) {
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
            obscureText: !state.isPasswordVisible,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Old Password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(state.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () => context.read<OldPasswordBloc>().add(OldPasswordVisibilityToggled()),
              ),
            ),
            onChanged: (val) => context.read<OldPasswordBloc>().add(OldPasswordChanged(val)),
          ),
        );
      },
    );
  }
}
