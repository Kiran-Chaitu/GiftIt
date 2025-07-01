import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import '../../configs/colors/app_colors.dart';


class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 30.h,),
                    Text("Want to Volunteer ?!",style: AppTextStyles.heading1.copyWith(
                        fontSize: 30
                    ),),
                    SizedBox(height: 30.h,),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
                        child: Container(
                          // alignment: Alignment.center,
                          height: 300.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16), // same as ClipRRect radius
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryGreen,
                                blurRadius: 15,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16), 
                            child: Image.asset(
                              'assets/images/Image3.png',
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 30.h,),
                    SizedBox(height: 30.h,),
                    Text("The registering members can also contribute\nby signing up as a volunteer to their desired \nNGO(s) and also helping that respective NGO.",style: AppTextStyles.heading1.copyWith(
                        fontSize: 15.5.h,
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
                      // padding: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade300
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesNames.onBoarding,
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
          )
      ),
    );
  }
}
