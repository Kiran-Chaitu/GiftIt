import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/Reset_password/widgets/reset_pswd_bloc_screen.dart';
// import 'package:giftit/views/auth/reset_password/widgets/reset_password_widget_bloc.dart';

class ResetPasswordMainScreen extends StatelessWidget {
  final String? email;
  const ResetPasswordMainScreen({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height / 6),
            Container(
              height: (size.height / 6) * 5,
              width: size.width,
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child:  ResetPasswordScreenBloc(email: email!),
            ),
          ],
        ),
      ),
    );
  }
}
