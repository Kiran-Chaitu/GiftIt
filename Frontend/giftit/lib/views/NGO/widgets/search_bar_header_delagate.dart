import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_dimesnions.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';

class SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TextEditingController searchController;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  SearchBarHeaderDelegate({
    required this.searchController,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.screenPadding),
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(AppDimensions.circleRadius),
        ),
        child: TextField(
          controller: searchController,
          onChanged: onChanged,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.text,
          style: AppTextStyles.bodyText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
            border: InputBorder.none,
            hintText: 'Search NGOs',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: searchController.text.isNotEmpty
                ? IconButton(icon: const Icon(Icons.clear), onPressed: onClear)
                : null,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 65.h;

  @override
  double get minExtent => 55.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
