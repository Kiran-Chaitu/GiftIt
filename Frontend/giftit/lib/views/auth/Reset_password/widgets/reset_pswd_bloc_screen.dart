import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/common_reset_pswd_bloc_floder/reset_pswd_main_bloc.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/auth/Reset_password/widgets/reset_pswd_textfield.dart';
import 'package:giftit/views/auth/validations/auth_validations.dart';
import 'package:giftit/views/widgets/redirection_butttons_with_text.dart';
import 'package:giftit/views/widgets/custom_loader.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class ResetPasswordScreenBloc extends StatelessWidget {
  final String email;
  const ResetPasswordScreenBloc({super.key, required this.email});

  void _onResetPswdButtonSubmitFunction(BuildContext context) {
    final currentState =context.read<ResetPasswordBloc>().state;
    final validationMessage =ValidationsOfAuth.resetPasswordValidation(currentState);
    if (validationMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            validationMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
      return;
    }
    context.read<ResetPasswordBloc>().add(SubmitResetPassword(email));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        final status = state.resetResponse.status;
        final message = (status == Status.success)
          ? state.resetResponse.data?.message ?? 'Password reset successfully.'
          : state.resetResponse.message ?? 'Something went wrong.';

        // final message = state.resetResponse.data?.message ?? state.resetResponse.message ?? '';

        // final message = state.resetResponse.message ?? '';

        if (status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
        } 
        else if (status == Status.success) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text(message, style: const TextStyle(color: Colors.green)),
          // ));
          // Future.microtask(() {
            // if (!mounted) return;
            Navigator.pushNamed(
              context,
              RoutesNames.login,
              // arguments: token,
            );
          // });
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              // Text(
              //   "Reset Password",
              //   style: Theme.of(context).textTheme.headlineSmall,
              // ),
              // const SizedBox(height: 10),
              // Text(
              //   "Enter a new password and confirm it",
              //   style: Theme.of(context).textTheme.bodySmall,
              // ),
              // const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Enter New Password",
                  // style: Theme.of(context).textTheme.headlineSmall,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
                ),
              ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Set your new password", style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 40),
              ResetPasswordTextfield(type: "New Password"),
              const SizedBox(height: 20),
              ResetPasswordTextfield(type: "Confirm Password"),
              const SizedBox(height: 40),
              state.resetResponse.status == Status.loading
                  ? const CustomLoader()
                  : RedirectionButttonsWithText(
                      text: "Confirm",
                      width: (size.width / 3) * 2,
                      height: size.height / 10,
                      onTap:()=> _onResetPswdButtonSubmitFunction(context),
                      buttonColor: AppColors.primaryGreen,
                    ),
            ],
          ),
        );
      },
    );
  }
}
