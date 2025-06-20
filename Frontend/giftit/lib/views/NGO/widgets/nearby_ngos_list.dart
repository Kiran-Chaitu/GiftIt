import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/models/ngo_model.dart';

class NearbyNgosList extends StatefulWidget {
  final List<NgoModel> ngoList;
  const NearbyNgosList({super.key , required this.ngoList});

  @override
  State<NearbyNgosList> createState() => _NearbyNgosListState();
}

class _NearbyNgosListState extends State<NearbyNgosList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.ngoList.length,
        itemBuilder: (context, index) {
          final ngo = widget.ngoList[index];
          return Card(
            elevation: 2,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          ngo.name,
                          style: AppTextStyles.heading3,
                        ),
                      ),
                      Text(
                        '${ngo.distance.toStringAsFixed(2)} km',
                        style: AppTextStyles.bodyText.copyWith(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.darkGreen,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Text(
                          ngo.vicinity,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      margin: EdgeInsets.only(top: 8.h, right: 8.w),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        'View Details',
                        style: AppTextStyles.bodyText.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
