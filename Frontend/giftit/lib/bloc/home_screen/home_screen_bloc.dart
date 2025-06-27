import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/home_screen/home_screen_event.dart';
import 'package:giftit/bloc/home_screen/home_screen_state.dart';
import 'package:giftit/data/API_Response/response.dart';

import '../../models/home_screen_models/available_donations_model.dart';
import '../../models/home_screen_models/donations_status.dart';
import '../../repository/home_screen_repository.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final DonationRepository homeScreenRepository;
  HomeScreenBloc({required this.homeScreenRepository}) : super(const HomeScreenState()) {
    on<LoadHomeScreen>(_onLoadHomeScreen);
    on<ClaimDonation>(_onClaimDonation);
  }

  Future<void> _onLoadHomeScreen(
      LoadHomeScreen event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(
      availableDonationsResponse: const ApiResponse.loading(),
      DonationsStatusResponse: const ApiResponse.loading(),
      donationCount: 0,
    ));


    // try {
    //   final donationCount = await homeScreenRepository.fetchDonationCount();
    //   final donationStatus = await homeScreenRepository.fetchDonationStatus();
    //   final availableDonations = await homeScreenRepository.fetchAvailableDonations();
    //
    //   emit(state.copyWith(
    //     donationCount: donationCount,
    //     DonationsStatusResponse: ApiResponse.success(donationStatus),
    //     availableDonationsResponse: ApiResponse.success(availableDonations),
    //   ));
    // } catch (e) {
    //   emit(state.copyWith(
    //     donationCount: 0,
    //     DonationsStatusResponse:
    //     ApiResponse.failure("Failed to load my donations"),
    //     availableDonationsResponse:
    //     ApiResponse.failure("Failed to load available donations"),
    //   ));
    // }

    await Future.delayed(Duration(seconds: 1)); // Simulate delay


    try {
      // Dummy data for now
      final donationStatus = [
        DonationStatusModel(
          item: 'Food',
          imageUrl:
          'https://cdn-icons-png.flaticon.com/512/1046/1046754.png',
          status: 'Active',
        ),
        DonationStatusModel(
          item: 'Clothes',
          imageUrl:
          'https://img.icons8.com/ios11/200w/FFFFFF/clothes.png',
          status: 'Claimed',
        ),
        DonationStatusModel(
          item: 'Books',
          imageUrl:
          'https://cdn-icons-png.flaticon.com/512/1046/1046754.png',
          status: 'cancelled',
        ),
      ];

      final availableDonations = [
        AvailableDonationModel(
          id: '2',
          imageUrl:
          'https://icon-library.com/images/food-icon-white/food-icon-white-15.jpg',
          name: 'Rina Patel',
          item: 'Food',
          address: 'Ahmedabad, India',
          items: [
            {'name': 'Shirt', 'pieces': 2},
            {'name': 'Pant', 'pieces': 1},
          ],
        ),
        AvailableDonationModel(
          id: '2',
          imageUrl:
          'https://icon-library.com/images/food-icon-white/food-icon-white-15.jpg',
          name: 'Kishore Kumar',
          item: 'Food',
          address: 'Kakinada, India',
          items: [
            {'name': 'Shirt', 'pieces': 2},
            {'name': 'Pant', 'pieces': 1},
          ],
        ),
        AvailableDonationModel(
          id: '1',
          imageUrl:
          'https://img.icons8.com/ios11/200w/FFFFFF/clothes.png',
          name: 'Ankit Sharma',
          item: 'Clothes',
          address: 'Delhi, India',
          items: [
            {'name': 'Shirt', 'pieces': 2},
            {'name': 'Pant', 'pieces': 1},
          ],
        ),

        // AvailableDonationModel(
        //   id: '3',
        //   imageUrl:
        //   'https://thumbs.dreamstime.com/b/book-icon-black-background-flat-style-vector-illustration-168420237.jpg',
        //   name: 'Mohit Raj',
        //   item: 'Books',
        //   address: 'Patna, India',
        //   items: [
        //     {'name': 'Shirt', 'pieces': 2},
        //     {'name': 'Pant', 'pieces': 1},
        //   ],
        // ),
      ];

      emit(state.copyWith(
        availableDonationsResponse:
        ApiResponse.success(availableDonations),
        DonationsStatusResponse: ApiResponse.success(donationStatus),
        donationCount: 127,
      ));
    } catch (e) {
      emit(state.copyWith(
        availableDonationsResponse:
        ApiResponse.failure("Failed to load available donations"),
        DonationsStatusResponse:
        ApiResponse.failure("Failed to load my donations"),
        donationCount: 0,
      ));
    }
  }

  Future<void> _onClaimDonation(ClaimDonation event, Emitter<HomeScreenState> emit) async {
    // Optionally show loading or update state
    try {
      // Call backend to claim donation (not implemented here)
      await Future.delayed(Duration(milliseconds: 500));

      // Reload screen after claiming
      add(LoadHomeScreen());
    } catch (e) {
      // You could also show a snackbar or emit an error message here
    }
  }
}
