import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/otp/widgets/otp_widget_bloc.dart';

class OtpMainScreen extends StatelessWidget {
  final String email;
  const OtpMainScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    Size siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:AppColors.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: siz.height / 6),
            Container(
              height: (siz.height / 6) * 5,
              width: siz.width,
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text("Enter Your OTP!", style: Theme.of(context).textTheme.headlineSmall),
                  Text("We have sent you an otp to your email", style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 20),
                  Text(email, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 50),
                  OtpScreenBloc(email: email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
