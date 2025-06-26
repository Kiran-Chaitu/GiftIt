
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
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
  import 'package:giftit/views/NGO/widgets/search_bar_header_delagate.dart';
  import 'package:giftit/views/NGO/widgets/search_suggestions_list.dart';
  import 'package:giftit/views/widgets/cards_shimmer_loader.dart';
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
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<NgoBloc>().add(LoadNearbyNgos());
            },
            color: AppColors.primaryGreen,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.screenPadding,
                  vertical: AppDimensions.smallSpacing),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      'Explore NGOs',
                      style: AppTextStyles.heading1,
                    ),


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDimensions.screenPadding),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  'Explore NGOs',
                  style: AppTextStyles.heading1,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SearchBarHeaderDelegate(
                  searchController: _searchController,
                  onChanged: (value) {
                    final ngoBloc = context.read<NgoBloc>();
                    final ngoState = ngoBloc.state;
                    if (_searchController.text.isNotEmpty) {
                      ngoBloc.add(SearchSuggestions(
                          input: _searchController.text.trim()));
                    } else {
                      if (ngoState.nearByNgoApiResponse.data != null) {
                        ngoBloc.add(RevertToNearbyNgos());
                      } else {
                        ngoBloc.add(LoadNearbyNgos());
                      }
                    }
                  },
                  onClear: () {
                    _searchController.clear();
                    context.read<NgoBloc>().add(RevertToNearbyNgos());
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              SliverToBoxAdapter(
                  child: SizedBox(height: AppDimensions.sectionSpacing)),
              SliverToBoxAdapter(
                child: BlocBuilder<NgoBloc, NgoState>(
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
                                        message:
                                            state.nearByNgoApiResponse.message,
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
                                    context.read<NgoBloc>().add(
                                        SearchSuggestions(
                                            input:
                                                _searchController.text.trim()));
                                  })),
                        );
                      } else if (state.searchSuggestionsApiResponse.status ==
                          Status.success) {
                        final searchSuggestions =
                            state.searchSuggestionsApiResponse.data;

                        if (searchSuggestions == null ||
                            searchSuggestions.isEmpty) {
                          return SizedBox(
                            height: context.mediaQueryHeight * 0.55,
                            child: Center(
                              child: Text(
                                'No Search Results Found!',
                                style: AppTextStyles.heading3,
                              ),
                            ),
                          );
                        }
                        debugPrint(searchSuggestions.length.toString());
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
                    } else if (state.searchStatus == SearchStatus.success) {
                      return SizedBox(
                          height: context.mediaQueryHeight * 0.65,
                          width: double.infinity,
                          child: SearchedNgo());
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: AppDimensions.sectionSpacing,
                ),
              ),
            ],
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SearchBarHeaderDelegate(
                      searchController: _searchController,
                      onChanged: (value) {
                        final ngoBloc = context.read<NgoBloc>();
                        final ngoState = ngoBloc.state;
                        if (_searchController.text.isNotEmpty) {
                          ngoBloc.add(SearchSuggestions(
                              input: _searchController.text.trim()));
                        } else {
                          if (ngoState.nearByNgoApiResponse.data != null) {
                            ngoBloc.add(RevertToNearbyNgos());
                          } else {
                            ngoBloc.add(LoadNearbyNgos());
                          }
                        }
                      },
                      onClear: () {
                        _searchController.clear();
                        context.read<NgoBloc>().add(RevertToNearbyNgos());
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: SizedBox(height: AppDimensions.sectionSpacing)),
                  SliverToBoxAdapter(
                    child: BlocBuilder<NgoBloc, NgoState>(
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
                                  return Center(
                                    child: CardsShimmerLoader(),
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
                            return Center(
                              child: CardsShimmerLoader(),
                            );
                          } else if (state.searchSuggestionsApiResponse.status ==
                              Status.failure) {
                            return SizedBox(
                              height: context.mediaQueryHeight * 0.55,
                              child: Center(
                                  child: CustomErrorWidget(
                                      message: state.nearByNgoApiResponse.message,
                                      onRetry: () async {
                                        context.read<NgoBloc>().add(
                                            SearchSuggestions(
                                                input: _searchController.text
                                                    .trim()));
                                      })),
                            );
                          } else if (state.searchSuggestionsApiResponse.status ==
                              Status.success) {
                            final searchSuggestions =
                                state.searchSuggestionsApiResponse.data;

                            if (searchSuggestions == null ||
                                searchSuggestions.isEmpty) {
                              return SizedBox(
                                height: context.mediaQueryHeight * 0.55,
                                child: Center(
                                  child: Text(
                                    'No Search Results Found!',
                                    style: AppTextStyles.heading3,
                                  ),
                                ),
                              );
                            }
                            debugPrint(searchSuggestions.length.toString());
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
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: AppDimensions.sectionSpacing,
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
      );
    }
  }
