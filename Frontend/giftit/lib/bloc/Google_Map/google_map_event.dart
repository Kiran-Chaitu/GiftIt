import 'package:equatable/equatable.dart';
import 'package:giftit/models/ngo_models/ngo_model.dart';

abstract class GoogleMapEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadSelectedNgo extends GoogleMapEvent {
  final NgoModel selectedNgo;

  LoadSelectedNgo({required this.selectedNgo});

  @override
  List<Object?> get props => [selectedNgo];
}

class UpdateMapElements extends GoogleMapEvent {}
