import 'package:equatable/equatable.dart';

abstract class FoodFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleFoodType extends FoodFormEvent {
  final bool isVeg;
  ToggleFoodType(this.isVeg);
  @override
  List<Object?> get props => [isVeg];
}

class AddFoodItem extends FoodFormEvent {
  final String name, quantity;
  AddFoodItem({required this.name, required this.quantity});

  @override
  List<Object?> get props => [name, quantity];
}


class EditFoodItem extends FoodFormEvent {
  final bool isVeg;
  final String name, quantity;

  EditFoodItem({
    required this.isVeg,
    required this.name,
    required this.quantity,
  });

  @override
  List<Object?> get props => [isVeg, name, quantity];
}

class DeleteFoodItem extends FoodFormEvent {
  final bool isVeg;
  final String itemName; 

  DeleteFoodItem({required this.isVeg, required this.itemName});

  @override
  List<Object?> get props => [isVeg, itemName];
}


class StartEditFoodItem extends FoodFormEvent {
  final String itemName;
  final String quantity;
  final bool isVeg;

  StartEditFoodItem({ required this.itemName ,required this.quantity , required this.isVeg});

  @override
  List<Object?> get props => [itemName,quantity , isVeg];
}

class CancelEditing extends FoodFormEvent {}
