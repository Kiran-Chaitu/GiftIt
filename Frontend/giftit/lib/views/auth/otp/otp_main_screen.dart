import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/otp/widgets/otp_widget_bloc.dart';

class OtpMainScreen extends StatelessWidget {
  final String email,type;
  const OtpMainScreen({super.key, required this.email,required this.type});

  @override
  Widget build(BuildContext context) {
    Size siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:AppColors.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: siz.height / 6),
            Container(
              height: siz.height/6,
              child: Align(
                alignment: Alignment.topLeft,
                 child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
                    child: Text("GiftIt", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                  ),
              ),
            ),
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
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const SizedBox(height: 40),
              //     const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 24.0),
              //       child: Text("Welcome Back!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              //     ),
              //     const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 24.0),
              //       child: Text("Sign in to continue", style: TextStyle(color: Colors.grey)),
              //     ),
              //     const SizedBox(height: 30),
              //     const LoginScreenWithBloc(),
              //   ],
              // ),
              child: Column(                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 24.0),
                  //   child: Text("Welcome Back!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  // ),
                  Padding(
                     padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Enter Your OTP!",
                       style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    //  style: Theme.of(context).textTheme.headlineSmall)
                  ),
                  // Text("We have sent you an otp to your email", style: Theme.of(context).textTheme.bodySmall),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text("We have sent you an otp to your email", style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 20),
                  // Text(email, style: Theme.of(context).textTheme.bodyMedium),
                  Padding(
                     padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(email, style: Theme.of(context).textTheme.bodyMedium)
                  ),
                  const SizedBox(height: 50),
                  OtpScreenBloc(email: email,type: type,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
