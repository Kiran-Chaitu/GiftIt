import 'package:equatable/equatable.dart';

abstract class NgoEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class LoadNearbyNgos extends NgoEvent {}

class RefreshNearbyNgos  extends NgoEvent{}