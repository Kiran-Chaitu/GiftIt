import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/forget_password/email_forget_pwd_folder/widgets/email_fp_screen_bloc_widget.dart';

class EmailMainScreen extends StatelessWidget {
  const EmailMainScreen({super.key});

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
              child: const EmailScreenBlocWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
