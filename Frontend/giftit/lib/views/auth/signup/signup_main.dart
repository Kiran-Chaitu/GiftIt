import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/signup/widgets/signup_widget_bloc.dart';

class SignupMainScreen extends StatelessWidget {
  const SignupMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink,
      // appBar: AppBar(title: Text('Giftit')),
      body: Stack(
        children: [
          Positioned(
            top:0,left: 0,
            child: SizedBox(height: siz.height/5,),
          ),
          Positioned(
            top:siz.height/6 ,
            child: Container(
              height: (siz.height/6)*5,
              width: siz.width,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome",textAlign: TextAlign.left,),
                  SizedBox(height: 30,),
                  SignupSceenBloc(),
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
