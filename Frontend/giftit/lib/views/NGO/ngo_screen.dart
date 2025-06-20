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
import 'package:giftit/utils/enums.dart';
import 'package:giftit/utils/extensions/general_extensions.dart';
import 'package:giftit/views/NGO/widgets/nearby_ngos_list.dart';
import 'package:giftit/views/NGO/widgets/search_suggestions_list.dart';
import 'package:giftit/views/widgets/custom_error_widget.dart';
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

  final TextEditingController _searchController = TextEditingController();

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
                        controller: _searchController,
                        onChanged: (value) {
                          if (_searchController.text.length > 2) {
                            context.read<NgoBloc>().add(SearchSuggestions(
                                _searchController.text.trim()));
                          }
                        },
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
                  BlocBuilder<NgoBloc, NgoState>(
                    builder: (context, state) {
                      if (state.searchStatus == SearchStatus.initial) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NGOs Nearby',
                              style: AppTextStyles.heading2,
                            ),
                            BlocBuilder<NgoBloc, NgoState>(
                                builder: (context, state) {
                              if (state.nearByNgoApiResponse.status ==
                                  Status.loading) {
                                return SizedBox(
                                  height: context.mediaQueryHeight * 0.55,
                                  child: Center(
                                    child: CustomLoader(),
                                  ),
                                );
                              } else if (state.nearByNgoApiResponse.status ==
                                  Status.failure) {
                                return SizedBox(
                                  height: context.mediaQueryHeight * 0.55,
                                  child: Center(
                                      child: CustomErrorWidget(
                                          message: state
                                              .nearByNgoApiResponse.message,
                                          onRetry: () async {
                                            context
                                                .read<NgoBloc>()
                                                .add(LoadNearbyNgos());
                                          })),
                                );
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
                                return NearbyNgosList(ngoList: ngoList);
                              }
                              return SizedBox.shrink();
                            }),
                          ],
                        );
                      } else if (state.searchStatus == SearchStatus.searching) {
                        if (state.searchSuggestionsApiResponse.status ==
                            Status.loading) {
                          return SizedBox(
                            height: context.mediaQueryHeight * 0.55,
                            child: Center(
                              child: CustomLoader(),
                            ),
                          );
                        } else if (state.searchSuggestionsApiResponse.status ==
                            Status.failure) {
                          return SizedBox(
                            height: context.mediaQueryHeight * 0.55,
                            child: Center(
                                child: CustomErrorWidget(
                                    message: state.nearByNgoApiResponse.message,
                                    onRetry: () async {
                                      context
                                          .read<NgoBloc>()
                                          .add(LoadNearbyNgos());
                                    })),
                          );
                        } else if (state.searchSuggestionsApiResponse.status ==
                            Status.success) {
                          final searchSuggestions =
                              state.searchSuggestionsApiResponse.data;
                          if (searchSuggestions == null ||
                              searchSuggestions.isEmpty) {
                            return Center(
                              child: Text(
                                'No Search Suggestions Found!',
                                style: AppTextStyles.bodyText,
                              ),
                            );
                          }
                          return SearchSuggestionsList(
                            controller: _searchController,
                            suggestions: searchSuggestions,
                            parentContext: context,
                          );
                        }
                        return SizedBox(
                          height: context.mediaQueryHeight * 0.55,
                          child: Center(
                            child: CustomLoader(),
                          ),
                        );
                      }

                      return SizedBox.shrink();
                    },
                  ),
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
