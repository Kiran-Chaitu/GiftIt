import 'package:equatable/equatable.dart';

class FoodFormState extends Equatable {
  final bool isVegChecked;
  final Map<String, String> vegItemsList;
  final Map<String, String> nonVegItemsList;
  final bool isEditing;

  const FoodFormState({
    this.isVegChecked = true,
    this.vegItemsList = const {},
    this.nonVegItemsList = const {},
    this.isEditing = false,
  });

  FoodFormState copyWith({
    bool? isVegChecked,
    Map<String, String>? vegItemsList,
    Map<String, String>? nonVegItemsList,
    bool? isEditing,
  }) {
    return FoodFormState(
      isVegChecked: isVegChecked ?? this.isVegChecked,
      vegItemsList: vegItemsList ?? this.vegItemsList,
      nonVegItemsList: nonVegItemsList ?? this.nonVegItemsList,
      isEditing: isEditing ?? this.isEditing
    );
  }

  @override
  List<Object?> get props => [
        isVegChecked,
        vegItemsList,
        nonVegItemsList,
        isEditing
      ];
}
