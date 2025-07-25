import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giftit/bloc/post_creation/post_creation_bloc.dart';
import 'package:giftit/bloc/post_creation/post_creation_event.dart';
import 'package:giftit/bloc/post_creation/post_creation_state.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/themes/app_dimesnions.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/widgets/custom_loader.dart';

import 'widgets/widgets.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final List<String> items = ['Food', 'Clothes', 'Utils'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryGreen,
        title: Text(
          'Post Creation',
          style: AppTextStyles.heading2.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppDimensions.screenPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppDimensions.smallSpacing),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Category :',
                      style: AppTextStyles.heading3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint:
                              BlocBuilder<PostCreationBloc, PostCreationState>(
                            builder: (context, state) {
                              return Text(
                                state.selectedCategory,
                                style: AppTextStyles.heading3,
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: AppTextStyles.heading3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            context
                                .read<PostCreationBloc>()
                                .add(ChangeCategory(selectedCategory: value!));
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.primaryGreen,
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: IconStyleData(
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: AppDimensions.iconMedium,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 150.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.primaryGreen,
                            ),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            height: 40.h,
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDimensions.smallSpacing),
                BlocBuilder<PostCreationBloc, PostCreationState>(
                    builder: (context, state) {
                  if (state.selectedCategory == 'Food') {
                    return const FoodForm();
                  } else if (state.selectedCategory == 'Clothes') {
                    return const ClothesForm();
                  } else if (state.selectedCategory == 'Utils') {
                    return const UtilsForm();
                  }
                  return SizedBox.shrink();
                }),
                SizedBox(height: AppDimensions.sectionSpacing),
                BlocBuilder<PostCreationBloc, PostCreationState>(
                  builder: (context, state) {
                    if (state.status == Status.loading) {
                      return const CustomLoader();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        // context
                        //     .read<PostCreationBloc>()
                        //     .add(SubmitPostForm());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text('Submit', style: AppTextStyles.heading3),
                    );
                  },
                ),
                SizedBox(height: AppDimensions.smallSpacing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
