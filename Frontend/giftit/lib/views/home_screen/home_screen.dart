import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/home_screen/home_screen_event.dart';
import 'package:giftit/views/home_screen/widgets/available_donations_card.dart';
import 'package:giftit/views/home_screen/widgets/donation_count_card.dart';
import 'package:giftit/views/widgets/custom_error_widget.dart';
import 'package:giftit/views/widgets/custom_loader.dart';
import '../../bloc/home_screen/home_screen_bloc.dart';
import '../../bloc/home_screen/home_screen_state.dart';
import '../../data/API_Response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeScreenBloc>().add(LoadHomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Vasu"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            if (state.availableDonationsResponse.status == Status.loading ||
                state.DonationsStatusResponse.status == Status.loading) {
              return const Center(child: CustomLoader());
            }

            if (state.availableDonationsResponse.status == Status.failure ||
                state.DonationsStatusResponse.status == Status.failure) {
              return Center(child: CustomErrorWidget(
                onRetry: () async {
                  context.read<HomeScreenBloc>().add(LoadHomeScreen());
                },
              ));
            }

            final available = state.availableDonationsResponse.data ?? [];
            final donationStatus = state.DonationsStatusResponse.data ?? [];

            return ListView(
              children: [
                ///Section 1: Donation Count
                DonationCountCard(numb: state.donationCount),
                // const SizedBox(height: 20),

                ///Section 2: My Donations
                // const Text("My Donations", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                // const SizedBox(height: 10),
                // SizedBox(
                //   height: 150,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: donationStatus.length,
                //     itemBuilder: (context, index) {
                //       final d = donationStatus[index];
                //       return DonationStatusCard(
                //         item: d.item,
                //         status: d.status,
                //         imageUrl: d.imageUrl,
                //       );
                //     },
                //   ),
                // ),
                // Container(
                // height: 200,
                // width: 50,
                // color: Colors.red,
                // ),
                // SizedBox(
                //   height: 150,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 1,
                //     itemBuilder: (context, index) {
                //       return DonationStatusCard(
                //         item: "Book",
                //         status: "active",
                //         imageUrl: "https://thumbs.dreamstime.com/b/book-icon-black-background-flat-style-vector-illustration-168420237.jpg",
                //       );
                //     },
                //   ),
                // ),
                const SizedBox(height: 20),

                ///Section 3: Available Donations
                const Text("Available Donations",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ...available.map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AvailableDonationCard(
                        id: d.id,
                        imageUrl: d.imageUrl,
                        name: d.name,
                        item: d.item,
                        address: d.address,
                        items: d.items,
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
