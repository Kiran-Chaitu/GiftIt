import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/home_screen/donations_status_screens/pending_donations_tab.dart';

import 'active_donations_tab.dart';
import 'donation_history.dart';

class DonationStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Donations"),
          backgroundColor: AppColors.background,
          bottom: TabBar(
            labelColor: AppColors.darkGreen,           // Selected tab text color
            unselectedLabelColor: AppColors.primaryGreen,  // Unselected tab text color
            indicatorColor: AppColors.darkGreen,
            tabs: [
              Tab(text: "Active",),
              Tab(text: "Pending",),
              Tab(text: "History"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveDonationsTab(),
            PendingDonationsTab(),
            HistoryDonationsTab(),
          ],
        ),
      ),
    );
  }
}
