import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/home_screen/donations_status_screens/pending_donations_tab.dart';

import 'active_donations_tab.dart';

class DonationStatusScreen extends StatelessWidget {
  const DonationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Donations",
            style: TextStyle(color: AppColors.background),
          ),
          backgroundColor: AppColors.primaryGreen,
          bottom: TabBar(
            labelColor: AppColors.background, // Selected tab text color
            unselectedLabelColor:
                AppColors.lightGreen, // Unselected tab text color
            indicatorColor: AppColors.darkGreen,
            tabs: [
              Tab(
                text: "Active",
              ),
              Tab(
                text: "Pending",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveDonationsTab(),
            PendingDonationsTab(),
          ],
        ),
      ),
    );
  }
}
