import 'package:flutter/material.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/views/post_createdialog/widgets/just_button.dart';

class DataDisplay extends StatelessWidget {
  const DataDisplay({super.key});  
  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    return Padding(
        // padding: EdgeInsets.all(AppDimensions.screenPadding),        
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
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
                      height: siz.height/4,
                      width: siz.height/4,
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
                    // SizedBox(height: 10), // Optional spacing
                    Text("NGO-name", style: AppTextStyles.heading2),
                    Text("NGO-type", style: AppTextStyles.subtitle),
                  ],
                ),
              ),      
              SizedBox(height: 10,),
              Container(child: Text("Description",style: AppTextStyles.heading2,)),
              Container(
                height: (siz.height/4),width: siz.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20,0, 0, 0),
                    child: Text(
                      "The quick brown rabbit jumps over the lazy fox. A flock of birds takes flight, their wings beating against the soft, warm breeze. The sun dips below the horizon, casting long shadows across the fields. A lone wolf howls at the moon, its mournful cry echoing in the still night air. Tiny stars begin to appear, twinkling like scattered diamonds across the vast expanse of the inky sky. The scent of damp earth and blooming honeysuckle fills the air. A gentle rain begins to fall, each drop a tiny pearl on the window pane. Inside, a cozy fire crackles, casting dancing shadows on the walls. It's a peaceful scene, a perfect end to a perfect day.",
                      style:AppTextStyles.bodyText,
                    ),
                  )),
              ),
                  //location  Text;
                  Text("Location",style: AppTextStyles.heading2,),          
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text("city\narea",style:AppTextStyles.bodyText),
                  ),  
              SizedBox(height: 10,)            ,
              // Buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,            
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: JustButton(
                      text: "DONATE", callBack: (){},height: siz.height/10,width:(siz.width/3)*2,
                    ),
                  ),
                  SizedBox(height: 10,),
                  JustButton(
                    text: "LOCATE", callBack: (){},height: siz.height/20,width:(siz.width/3)*2,
                  ),
                ]
              )

            ],
          )
        )
      );
  }
}