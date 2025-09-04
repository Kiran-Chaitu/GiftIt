import 'package:equatable/equatable.dart';

abstract class ClothesFormEvent extends Equatable {
  const ClothesFormEvent();

  @override
  List<Object?> get props => [];
}

class UpdateClothesName extends ClothesFormEvent {
  final String name;

  const UpdateClothesName(this.name);

  @override
  List<Object?> get props => [name];
}

class UpdateClothesQuantity extends ClothesFormEvent {
  final String quantity;

  const UpdateClothesQuantity(this.quantity);

  @override
  List<Object?> get props => [quantity];
}

class UpdateClothesSize extends ClothesFormEvent {
  final String size;

  const UpdateClothesSize(this.size);

  @override
  List<Object?> get props => [size];
}

class ToggleGender extends ClothesFormEvent {
  final String gender; // 'Male' or 'Female'

  const ToggleGender(this.gender);

  @override
  List<Object?> get props => [gender];
}

class AddClothesItem extends ClothesFormEvent {}

class StartEditClothesItem extends ClothesFormEvent {
  final int index;

  const StartEditClothesItem(this.index);

  @override
  List<Object?> get props => [index];
}

class UpdateClothesItem extends ClothesFormEvent {}

class DeleteClothesItem extends ClothesFormEvent {
  final int index;

  const DeleteClothesItem(this.index);

  @override
  List<Object?> get props => [index];
}

class CancelEditingClothesItem extends ClothesFormEvent {}
