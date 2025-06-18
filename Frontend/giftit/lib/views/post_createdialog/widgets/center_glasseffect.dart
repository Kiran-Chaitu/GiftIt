// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:giftit/configs/colors/app_colors.dart';
// import 'package:giftit/views/post_createdialog/widgets/just_button.dart';

// class Centerglasseffect extends StatelessWidget {
//   const Centerglasseffect({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20.0),
            
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // blur effect
//                 child: Container(
//                   width: 300,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color:Colors.white.withValues(alpha: (0.2 * 100)),                    
//                     // color: AppColors.background,
//                     borderRadius: BorderRadius.circular(20.0),
//                     // border: Border.all(
//                     //   // color:Colors.white.withValues(alpha: (0.3 * 255)),
//                     //   // color:Colors.black,
//                     //   // width: 1.5,
//                     // ),
//                     // boxShadow: [
//                     //   BoxShadow(
//                     //     color:Color(0x80000000),
//                     //     blurRadius: 10, // Softness of the shadow
//                     //     spreadRadius: 1, // How much the shadow spreads
//                     //     offset: Offset(4, -4), // X and Y offset
//                     //   ),
//                     // ]
                    
//                   ),
//                   child: Row(
//                     mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    
//                     children: [
//                       // JustButton(text: "Donate",callBack: (){},),                      
//                       // JustButton(text: "Request",callBack: (){},),                      
//                     ],
//                   )
//                 ),
//               ),
//             )
//     );
//   }
// }