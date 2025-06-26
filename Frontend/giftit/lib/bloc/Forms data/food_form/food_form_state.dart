import 'package:equatable/equatable.dart';

class FoodFormState extends Equatable {
  final bool isVegChecked;
  final bool isNonVegChecked;
  final Map<String, String> vegItemsList;
  final Map<String, String> nonVegItemsList;
  

  const FoodFormState({
    this.isVegChecked = false,
    this.isNonVegChecked = false,
    this.vegItemsList = const {},
    this.nonVegItemsList = const {}
  });

  FoodFormState copyWith({
    bool? isVegChecked,
    bool? isNonVegChecked,
    Map<String, String>? vegItemsList,
    Map<String , String >? nonVegItemsList,

  }) {
    return FoodFormState(
      isVegChecked: isVegChecked ?? this.isVegChecked,
      isNonVegChecked: isNonVegChecked ?? this.isNonVegChecked,
      vegItemsList: vegItemsList ?? this.vegItemsList,
      nonVegItemsList: nonVegItemsList ?? this.nonVegItemsList
    );
  }

  @override
  List<Object?> get props => [isVegChecked, isNonVegChecked , vegItemsList , nonVegItemsList];
}
