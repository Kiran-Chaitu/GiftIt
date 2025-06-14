import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_dimesnions.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/views/post_createdialog/widgets/just_button.dart';

class NgoDescription extends StatelessWidget {
  const NgoDescription({super.key});

  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body:
      Padding(
        // padding: EdgeInsets.all(AppDimensions.screenPadding),        
        padding: EdgeInsets.all(20),        
        child:SingleChildScrollView(
          child:Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ngo image
              Container(
                height: siz.height / 3,
                width: siz.width,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhuZMsc_-2l-WqV3xpCTHqi76yBY3qmK4FAQ&s"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Optional spacing
                    Text("NGO-name", style: AppTextStyles.heading2),
                    Text("NGO-type", style: AppTextStyles.subtitle),
                  ],
                ),
              ),          
              Container(child: Text("Description",style: AppTextStyles.heading2,)),
              Container(
                height: (siz.height/6)*2,width: siz.width,
                child: Text("",maxLines: 10,),
              ),
              // Text("Contact",style: AppTextStyles.heading2,),
              // //mail
              // Text("mail",style: AppTextStyles.subtitle,),

              //location  Text;
              Text("Location",style: AppTextStyles.heading2,),          
              Container(            
                height: 100,width: siz.width,
                child: Text(""),//ngo location Text
              ),
              // Buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,            
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: JustButton(
                      text: "Donate", callBack: (){},height: siz.height/10,width:(siz.width/3)*2,
                    ),
                  ),
                  SizedBox(height: 10,),
                  JustButton(
                    text: "location", callBack: (){},height: siz.height/20,width:(siz.width/3)*2,
                  ),
                ]
              )

            ],
          )
        )
      )
    );
  }

  
}