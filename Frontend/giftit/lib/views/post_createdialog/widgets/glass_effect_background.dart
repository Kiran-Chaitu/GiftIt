import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class Glasseffectbackground extends StatelessWidget {
  const Glasseffectbackground({super.key});

  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    return Container(
      height: siz.height,
      width: siz.width,
      
      decoration: BoxDecoration(
        // color:AppColors.background,
        // color: Colors.grey,
        
        // image: DecorationImage(
        //   image: NetworkImage("https://st.depositphotos.com/2101611/4270/i/450/depositphotos_42700879-stock-photo-frosted-glass-texture.jpg",),
        //   // image: NetworkImage("https://img.freepik.com/free-photo/paper-texture_1194-5999.jpg?uid=R122352975&ga=GA1.1.769035693.1735532461&semt=ais_items_boosted&w=740",),
        //   fit: BoxFit.cover
        // )



      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 300,width: 300, 
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha:  0.3*255),
            border: Border.all(color: Colors.black)
          ),       
        ),
      ),
    );
  }
}