import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/change_passwordBloc/old_password_bloc/old_pswd_main_bloc.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/auth/change_pswd_screens_floder/old_psswd_screens_folder/widgets/old_paswd_textfield.dart';
import 'package:giftit/views/auth/validations/auth_validations.dart';
import 'package:giftit/views/widgets/custom_loader.dart';
import 'package:giftit/views/widgets/redirection_butttons_with_text.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class OldPasswordScreenBlocWidget extends StatelessWidget {
  const OldPasswordScreenBlocWidget({super.key});
  void _onSubmit(BuildContext context) {
    final currentState = context.read<OldPasswordBloc>().state;
    final validationMessage =ValidationsOfAuth.oldPasswordValidation(currentState);
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

    context.read<OldPasswordBloc>().add(SubmitOldPassword());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<OldPasswordBloc, OldPasswordState>(
      
      listener: (context, state) {
        final status = state.oldPasswordResponse.status;
        final message = state.oldPasswordResponse.message ?? '';

        if (status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message,style: const TextStyle(color: Colors.red),)),
          );          
        } 
        else if (status == Status.success) {
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text(
            //       message,
            //       style: const TextStyle(color: Colors.green),
            //     ),
            //   ),
            // );
            debugPrint("Old Password Response: ${state.oldPasswordResponse.data}");
            Future.microtask(() {
              // if (!mounted) return;
              Navigator.pushNamed(
                context,
                RoutesNames.resetpswd, // Use your actual named route
                arguments: state.oldPasswordResponse.data?.email,
              );
            });
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              // Text(
              //   "Enter Old Password",
              //   style: Theme.of(context).textTheme.headlineSmall,
              // ),
              // const SizedBox(height: 10),
              // Text(
              //   "Verify your current password to continue",
              //   style: Theme.of(context).textTheme.bodySmall,
              // ),
              // const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Enter Old Password",
                  // style: Theme.of(context).textTheme.headlineSmall,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
                ),
              ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("Continue to change your password", style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 40),
              const OldPasswordTextField(),
              const SizedBox(height: 40),
              state.oldPasswordResponse.status == Status.loading
                  ? const CustomLoader()
                  : RedirectionButttonsWithText(
                      text: "Verify",
                      width: (size.width / 3) * 2,
                      height: size.height / 15,
                      onTap: () => _onSubmit(context),
                      buttonColor: AppColors.primaryGreen,
                    ),
            ],
          ),
        );
      },
    );
  }
}
