import 'package:flutter/material.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/views/post_createdialog/widgets/just_button.dart';

class Postcreationdialog extends StatelessWidget {
  const Postcreationdialog({super.key});

  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [          
          Container(
            color:Colors.grey.shade400,
            height: siz.height,
            width: siz.width,
            child: ClipRRect(
              child:Container(
                // height: 300,width: 300,
                height: siz.height,
                width: siz.width,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1*255),
                  // gradient:RadialGradient(
                  //   colors: [
                  //     Colors.white10,
                  //     Colors.white24,
                  //     Colors.white60,
                  //   ],
                  // center: Alignment.center,
                  // )
                ),
              ),
            ),
          ),
          
          Align(            
            alignment: Alignment.center,
            child: Container(
              height: ((siz.height/5)*2 ),
              width: ((siz.width/3)*2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(color: Colors.black,width: 0.2),
                boxShadow: [
                      BoxShadow(
                        color:Color(0x80000000),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(4, 4), 
                      ),
                    ]
              ),              
              child: Column(                  
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    JustButton(
                      text: "Donate",callBack: (){
                        Navigator.pushNamed(context, RoutesNames.postForm);
                      },
                      iconNeed: true,height: siz.height/10,width:(siz.width/6)*3,
                      frontIcon: Icon(IconData(0xf689, fontFamily: 'MaterialIcons'),size: 30,color: Colors.white,),
                    ),                      
                    SizedBox(height: 10,),
                    JustButton(
                      text: "Request",callBack: (){
                        Navigator.pushNamed(context, RoutesNames.postForm);
                      },height: siz.height/10,width:(siz.width/6)*3,
                      iconNeed: true,
                      frontIcon: Icon(IconData(0xe88a, fontFamily: 'MaterialIcons'), size: 30,color: Colors.white,),
                    ),                      
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}