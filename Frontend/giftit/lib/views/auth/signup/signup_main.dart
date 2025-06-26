import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/signup/widgets/signup_widget_bloc.dart';

class SignupMainScreen extends StatelessWidget {
  const SignupMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    // return Scaffold(
    //   backgroundColor: Colors.pink,
    //   // appBar: AppBar(title: Text('Giftit')),
    //   body: Stack(
    //     children: [
    //       Positioned(
    //         top:0,left: 0,
    //         child: SizedBox(height: siz.height/5,),
    //       ),
    //       Positioned(
    //         top:siz.height/6 ,
    //         child: Container(
    //           height: (siz.height/6)*5,
    //           width: siz.width,
    //           decoration: BoxDecoration(
    //             color: AppColors.background,
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(50),
    //               topRight: Radius.circular(50),
    //             )
    //           ),
    //           child: Column(
    //             // crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text("Welcome",textAlign: TextAlign.left,),
    //               SizedBox(height: 30,),
    //               SignupScreenBloc(),
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
      
    // );
  
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      // appBar: AppBar(title: Text('Giftit')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Positioned(
            //   top:0,left: 0,
            //   child: SizedBox(height: siz.height/5,),
            // ),
            // SizedBox(height:siz.height/10,),
            Container(
              height: siz.height/10,
              child: Align(
                alignment: Alignment.topLeft,
                 child:Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
                    child: Text("GiftIt", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.white)),
                  ),
              ),
            ),
            Container(
              height: (siz.height/10)*9,
              width: siz.width,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )
              ),
              // child: Column(
              //   // crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("Welcome",textAlign: TextAlign.left,),
              //     SizedBox(height: 30,),
              //     SignupScreenBloc(),
              //   ],
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text("Welcome Back!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: const Text(
                      "Signup to continue",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SignupScreenBloc(),
                ],
              ),
            )
          ],
        ),
      ),
      
    );
  
  }
}
