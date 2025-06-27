import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/profile/profile_bloc.dart';
import 'package:giftit/bloc/profile/profile_event.dart';
import 'package:giftit/bloc/profile/profile_state.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/configs/themes/app_dimesnions.dart';
import 'package:giftit/configs/themes/app_text_styles.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/widgets/custom_error_widget.dart';
import 'package:giftit/views/widgets/custom_loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.profileApiResponse.status == Status.loading) {
            return const Center(child: CustomLoader());
          } else if (state.profileApiResponse.status == Status.failure) {
            return Center(child: CustomErrorWidget(onRetry: () async {
              context.read<ProfileBloc>().add(LoadProfileEvent());
            }));
          }
          final profileData = state.profileApiResponse.data;
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(60),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(1, 1),
                        )
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,
                                  color: Colors.black,
                                  size: AppDimensions.iconSmall),
                              Text(profileData!.displayName,
                                  style: AppTextStyles.heading3),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.black,
                                  size: AppDimensions.iconSmall),
                              Text(profileData.location,
                                  style: AppTextStyles.heading3),
                            ],
                          ),
                          SizedBox(height: 30),
                          _buildProfileOption(context, 'Edit Profile',
                              Icons.edit, RoutesNames.editProfile),
                          _buildProfileOption(context, 'Donation History',
                              Icons.history, RoutesNames.donationHistory),
                          _buildProfileOption(context, 'NGO Volunteer',
                              Icons.people, RoutesNames.ngoVolunteer),
                          _buildProfileOption(context, 'Change Password',
                              Icons.lock, RoutesNames.changePassowrd),
                          _buildProfileOption(
                              context, 'Log Out', Icons.logout, null),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: MediaQuery.of(context).size.width / 2 - 60,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 0.2),
                  ),
                  child: Center(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileOption(
      BuildContext context, String title, IconData icon, String? targetPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.green,
          size: AppDimensions.iconMedium,
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyText,
        ),
        trailing: Icon(Icons.arrow_forward_ios,
            size: AppDimensions.iconMedium, color: Colors.black),
        onTap: () {
          if (targetPage != null) {
            if (targetPage == RoutesNames.editProfile) {
              Navigator.pushNamed(context, targetPage, arguments: {
                'profileModel': context.read<ProfileBloc>().state.profileApiResponse.data,
              });
            }
            Navigator.pushNamed(
              context,
              targetPage,
            );
          }
        },
      ),
    );
  }
}
