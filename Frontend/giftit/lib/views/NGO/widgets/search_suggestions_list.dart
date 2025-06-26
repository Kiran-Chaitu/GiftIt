import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/models/ngo_models/ngo_model.dart';
import 'package:giftit/views/widgets/custom_card_widget.dart';

class SearchSuggestionsList extends StatefulWidget {
  final TextEditingController controller;
  final List<NgoModel> suggestions;
  final BuildContext parentContext;
  const SearchSuggestionsList(
      {super.key,
      required this.controller,
      required this.suggestions,
      required this.parentContext});

  @override
  State<SearchSuggestionsList> createState() => _SearchSuggestionsListState();
}

class _SearchSuggestionsListState extends State<SearchSuggestionsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results',
          style: AppTextStyles.heading2,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.suggestions.length,
            itemBuilder: (context, index) {
              final ngo = widget.suggestions[index];
              return CustomCardWidget(
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
              ));
            }),
      ],
    );
  }
}
