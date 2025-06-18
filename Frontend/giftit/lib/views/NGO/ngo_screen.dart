import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/bloc/NGO/ngo_bloc.dart';
import 'package:giftit/bloc/NGO/ngo_event.dart';
import 'package:giftit/bloc/NGO/ngo_state.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_dimesnions.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/utils/extensions/general_extensions.dart';
import 'package:giftit/utils/utils.dart';
import 'package:giftit/views/widgets/custom_loader.dart';

class NgoScreen extends StatefulWidget {
  const NgoScreen({super.key});

  @override
  State<NgoScreen> createState() => _NgoScreenState();
}

class _NgoScreenState extends State<NgoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NgoBloc>().add(LoadNearbyNgos());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        style: AppTextStyles.heading3,
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
                  ),
                  BlocBuilder<NgoBloc, NgoState>(builder: (context, state) {
                    if (state.nearByNgoApiResponse.status == Status.loading) {
                      return SizedBox(
                        height: context.mediaQueryHeight * 0.55,
                        child: Center(
                          child: CustomLoader(),
                        ),
                      );
                    } else if (state.nearByNgoApiResponse.status ==
                        Status.failure) {
                      return Center(
                          child: Text(
                        state.nearByNgoApiResponse.message ??
                            'SomeThing Went Wrong',
                        style: AppTextStyles.bodyText,
                      ));
                    } else if (state.nearByNgoApiResponse.status ==
                        Status.success) {
                      final ngoList = state.nearByNgoApiResponse.data;
                      if (ngoList == null || ngoList.isEmpty) {
                        return Center(
                          child: Text(
                            'No Nearby NGO\'s Found!',
                            style: AppTextStyles.bodyText,
                          ),
                        );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: ngoList.length,
                          itemBuilder: (context, index) {
                            final ngo = ngoList[index];
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            ngo.name ?? "Unnamed NGO",
                                            style: AppTextStyles.heading3,
                                          ),
                                        ),
                                        Text(
                                          '${ngo.distance?.toStringAsFixed(2)} km',
                                          style:
                                              AppTextStyles.bodyText.copyWith(
                                            color: AppColors.primaryGreen,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    (ngo.socialFacilityType != null)
                                        ? Text(
                                            ' ${Utils.replaceUnderScoresAndCapitilize(ngo.socialFacilityType!)}')
                                        : SizedBox.shrink(),
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
                                            ngo.address ?? "No Address",
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w, vertical: 6.h),
                                        margin: EdgeInsets.only(
                                            top: 8.h, right: 8.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.lightGreen,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                        child: Text(
                                          'View Details',
                                          style:
                                              AppTextStyles.bodyText.copyWith(
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
                    return SizedBox.shrink();
                  }),
                  SizedBox(
                    height: 7.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
