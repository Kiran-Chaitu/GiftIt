import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeScreen extends HomeScreenEvent {}

class ClaimDonation extends HomeScreenEvent {
  final String donationId;

  const ClaimDonation(this.donationId);

  @override
  List<Object> get props => [donationId];
}
