import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/change_pswd_screens_floder/old_psswd_screens_folder/widgets/old_paswd_screen_bloc_widget.dart';

class OldPasswordMainScreen extends StatelessWidget {
  const OldPasswordMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryGreen,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: size.height / 6),
              Container(
                height: size.height/6,
                child: Align(
                  alignment: Alignment.topLeft,
                   child:Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
                      child: Text("GiftIt", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                    ),
                ),
              ),
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
                child: const OldPasswordScreenBlocWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
