import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'screen3.dart';
import '../../configs/colors/app_colors.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
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
            SizedBox(height: 7.5.h),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 15.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), // same as ClipRRect radius
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryGreen,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16), // clip the image
                        child: Image.asset(
                          'assets/images/Image2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
                  Text("GiftIt is a heartfelt initiative connecting donors \nwith verified NGOs to bring meaningful change \nthrough thoughtful giving",style: AppTextStyles.heading2.copyWith(
                    fontSize: 15.5
                  ),),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade300
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Screen3()),
                        );
                      },
                      icon: Icon(Icons.arrow_forward_rounded),
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
    );
  }
}
