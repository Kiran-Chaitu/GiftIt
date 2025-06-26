// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:giftit/configs/routes/route_names.dart';
// import 'package:giftit/configs/themes/app_text_styles.dart';
// import '../../configs/colors/app_colors.dart';
// import 'screen2.dart';
//
// class Screen1 extends StatefulWidget {
//   const Screen1({super.key});
//
//   @override
//   State<Screen1> createState() => _Screen1State();
// }
//
// class _Screen1State extends State<Screen1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 10.h,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                     onPressed: () {
//                         Navigator.pushNamed(
//                         context,
//                           RoutesNames.home,
//                         );
//                         },
//                   style: TextButton.styleFrom(
//                       padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//                       // backgroundColor: AppColors.primaryGreen,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         side: BorderSide(color: AppColors.primaryGreen),
//                       ),
//                   ),
//                     child: Text("Skip",style: AppTextStyles.heading1.copyWith(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),)
//                 ),
//                 SizedBox(width: 10.w,),
//               ],
//
//             ),
//             SizedBox(height: 7.5.h),
//             Container(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
//                     child: Container(
//                       height: 470,
//                       width: 320,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColors.primaryGreen,
//                             blurRadius: 6,
//                           )
//                         ],
//                       ),
//                       child: Image(image: AssetImage('assets/images/Image1.png')),
//                     ),
//                   ),
//                   Text(""),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20,),
//             Text("data"),
//             SizedBox(height: 60.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 10.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Colors.grey.shade300
//                     ),
//                     child: IconButton(
//                       onPressed: () {
//                         Navigator.pushNamed(
//                           context,
//                           RoutesNames.onBoarding_screen2,
//                         );
//                       },
//                       icon: Icon(Icons.arrow_forward),
//                       color: AppColors.primaryGreen,
//                       iconSize: 40.sp,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/views/onboarding/screen3.dart';
// import 'package:giftit/views/onboarding/screen3.dart';
import '../../configs/colors/app_colors.dart';
import 'screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesNames.home,
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                          // backgroundColor: AppColors.primaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            side: BorderSide(color: AppColors.primaryGreen),
                          ),
                        ),
                        child: Text("Skip",style: AppTextStyles.heading1.copyWith(
                          fontSize: 15,
                          color: Colors.black,
                        ),)
                    ),
                    SizedBox(width: 10.w,),
                  ],
                ),
                SizedBox(height: 15),
                Text("Welcome to GiftIT",style: AppTextStyles.heading1.copyWith(
                  fontSize: 30,
                  color: AppColors.primaryGreen,
                ),),
                SizedBox(height: 15,),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                        child: Container(
                          height: 470,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryGreen,
                                blurRadius: 6,
                              )
                            ],
                          ),
                          child: Image(image: AssetImage('assets/images/Image1.png')),
                        ),
                      ),
                      Text(""),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text("data"),
                SizedBox(height: 60.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade300
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RoutesNames.onBoarding_screen2,
                            );
                          },
                          icon: Icon(Icons.arrow_forward),
                          color: AppColors.primaryGreen,
                          iconSize: 40.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Screen2(),
          Screen3()
        ],
      ),
    );
  }
}
