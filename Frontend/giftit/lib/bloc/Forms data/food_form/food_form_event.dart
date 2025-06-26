import 'package:equatable/equatable.dart';

abstract class FoodFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckFoodType extends FoodFormEvent {
  final String type;
  CheckFoodType({required this.type});

  @override
  List<Object?> get props => [type];
}
