import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/widgets/custom_card_widget.dart';

class CardsShimmerLoader extends StatelessWidget {
  const CardsShimmerLoader({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomCardWidget(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 16.h,
                      width: 120.w,
                      color: Colors.white,
                    ),
                    Container(
                      height: 16.h,
                      width: 50.w,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Container(
                  height: 10.h,
                  width: 120.w,
                  color: Colors.white,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.darkGreen),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Container(
                        height: 14.h,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                // View Details button
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
