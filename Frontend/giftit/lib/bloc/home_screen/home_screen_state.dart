import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/response.dart';

import '../../models/home_screen_models/available_donations_model.dart';
import '../../models/home_screen_models/donations_status.dart';

class HomeScreenState extends Equatable {
  final ApiResponse<List<DonationStatusModel>> DonationsStatusResponse;
  final ApiResponse<List<AvailableDonationModel>> availableDonationsResponse;
  final int donationCount;

  const HomeScreenState({
    this.DonationsStatusResponse = const ApiResponse.initial(),
    this.availableDonationsResponse = const ApiResponse.initial(),
    this.donationCount = 0,
  });

  HomeScreenState copyWith({
    ApiResponse<List<DonationStatusModel>>? DonationsStatusResponse,
    ApiResponse<List<AvailableDonationModel>>? availableDonationsResponse,
    int? donationCount,
  }) {
    return HomeScreenState(
      DonationsStatusResponse: DonationsStatusResponse ?? this.DonationsStatusResponse,
      availableDonationsResponse:
      availableDonationsResponse ?? this.availableDonationsResponse,
      donationCount: donationCount ?? this.donationCount,
    );
  }

  @override
  List<Object?> get props => [
    DonationsStatusResponse,
    availableDonationsResponse,
    donationCount,
  ];
}
