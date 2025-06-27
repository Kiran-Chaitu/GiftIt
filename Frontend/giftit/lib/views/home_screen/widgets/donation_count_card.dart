import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';

class DonationCountCard extends StatelessWidget {
  int numb;
  DonationCountCard({required this.numb});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DonationCardClipper(),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            gradient: LinearGradient(
                colors: [AppColors.primaryGreen,AppColors.darkGreen],
                stops: [0.3,1.0]
            )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Donations :",style: AppTextStyles.heading1.copyWith(color: Colors.white)),
                Text(numb.toString(),style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DonationCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(250, size.height);
    path.lineTo(200, size.height - 20);
    path.lineTo(0, size.height - 20);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}