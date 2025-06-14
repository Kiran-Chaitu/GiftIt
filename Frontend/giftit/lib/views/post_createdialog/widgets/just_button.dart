import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';

class JustButton extends StatelessWidget {
  final String text;
  final VoidCallback callBack;
  final bool iconNeed;
  final Icon frontIcon;
  final double height,width;
  JustButton({
    super.key,
    required this.text,
    required this.callBack,
    this.iconNeed=false,
    this.frontIcon=const Icon(IconData(0xf689, fontFamily: 'MaterialIcons'),size: 30,color: Colors.white,),
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {  
    Size siz=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: callBack,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),          
          color: Color(0XFF168a63),
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 30.0,
          //     offset: Offset(-10, -10),
          //     color: Colors.green,
          //     inset:true,
          //   ),
          //   BoxShadow(
          //     blurRadius: 30.0,
          //     offset: Offset(10, 10),
          //     color: Colors.green,
              
          //   ),
          // ],
        ),
        height: height,
        width:width,
        
        child: 
        Row(          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            // (text[0]=='D')?
            //     Icon(
            //       IconData(0xf689, fontFamily: 'MaterialIcons'), // code point for 'home' icon
            //       size: 30,
            //       color: Colors.white,
            //     )
            //     :Icon(
            //       IconData(0xe88a, fontFamily: 'MaterialIcons'), // code point for 'home' icon
            //       size: 30,
            //       color: Colors.white,
            //     ),
            (iconNeed==true)?frontIcon:SizedBox(height: 0,width: 0,),
            SizedBox(width: 5,),
            Text(text,style: TextStyle(fontSize: 20,color: Colors.white),)
          ],
        ),
      )
    );
  }
}