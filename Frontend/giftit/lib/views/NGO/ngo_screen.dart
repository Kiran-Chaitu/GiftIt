import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_dimesnions.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';

class NgoScreen extends StatefulWidget {
  const NgoScreen({super.key});

  @override
  State<NgoScreen> createState() => _NgoScreenState();
}

class _NgoScreenState extends State<NgoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.screenPadding),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore NGOs',
                  style: AppTextStyles.heading1,
                ),
                SizedBox(
                  height: AppDimensions.smallSpacing * 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: AppColors.lightGreen,
                      borderRadius:
                          BorderRadius.circular(AppDimensions.circleRadius),
                    ),
                    child: TextField(
                      style: AppTextStyles.bodyText,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search NGOs',
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimensions.sectionSpacing,
                ),
                Text(
                  'NGOs Nearby',
                  style: AppTextStyles.heading2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
