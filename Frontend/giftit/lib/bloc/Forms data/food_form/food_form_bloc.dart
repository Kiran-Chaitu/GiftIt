import 'package:bloc/bloc.dart';
import 'package:giftit/bloc/Forms%20data/food_form/food_form_event.dart';
import 'package:giftit/bloc/Forms%20data/food_form/food_form_state.dart';

class FoodFormBloc extends Bloc<FoodFormEvent, FoodFormState> {
  FoodFormBloc() : super(FoodFormState()) {
    on<ToggleFoodType>(_toggleFoodType);
    on<AddFoodItem>(_addFoodItem);
    on<DeleteFoodItem>(_deleteFoodItem);
    on<EditFoodItem>(_editFoodItem);
    on<StartEditFoodItem>(_startEdit);
    on<CancelEditing>(_cancelEditing);
  }

  void _toggleFoodType(ToggleFoodType event, Emitter<FoodFormState> emit) {
    emit(state.copyWith(isVegChecked: event.isVeg));
  }

  void _addFoodItem(AddFoodItem event, Emitter<FoodFormState> emit) {
    final isVeg = state.isVegChecked;

    if (isVeg) {
      final updatedVegList = Map<String, String>.from(state.vegItemsList)
        ..[event.name] = event.quantity;
      emit(state.copyWith(vegItemsList: updatedVegList));
    } else {
      final updatedNonVegList = Map<String, String>.from(state.nonVegItemsList)
        ..[event.name] = event.quantity;

      emit(state.copyWith(nonVegItemsList: updatedNonVegList));
    }
  }

  void _editFoodItem(EditFoodItem event, Emitter<FoodFormState> emit) {
    final updatedVegList = Map<String, String>.from(state.vegItemsList);
    final updatedNonVegList = Map<String, String>.from(state.nonVegItemsList);
    if (event.isVeg) {
      if (updatedVegList.containsKey(event.name)) {
        updatedVegList[event.name] = event.quantity;
        emit(state.copyWith(vegItemsList: updatedVegList, isEditing: false));
      } else {
        updatedNonVegList.remove(event.name);
        updatedVegList[event.name] = event.quantity;
        emit(state.copyWith(
            vegItemsList: updatedVegList, nonVegItemsList: updatedNonVegList, isEditing: false));
      }
    } else {
      if (updatedNonVegList.containsKey(event.name)) {
        updatedNonVegList[event.name] = event.quantity;
        emit(state.copyWith(
            nonVegItemsList: updatedNonVegList, isEditing: false));
      }
      else {
        updatedVegList.remove(event.name);
        updatedNonVegList[event.name] = event.quantity;
        emit(state.copyWith(
            vegItemsList: updatedVegList, nonVegItemsList: updatedNonVegList, isEditing: false));
      }
    }
  }

  void _deleteFoodItem(DeleteFoodItem event, Emitter<FoodFormState> emit) {
    if (event.isVeg) {
      final updatedVegList = Map<String, String>.from(state.vegItemsList);
      updatedVegList.remove(event.itemName);
      emit(state.copyWith(vegItemsList: updatedVegList));
    } else {
      final updatedNonVegList = Map<String, String>.from(state.nonVegItemsList);
      updatedNonVegList.remove(event.itemName);
      emit(state.copyWith(nonVegItemsList: updatedNonVegList));
    }
  }

  void _startEdit(StartEditFoodItem event, Emitter<FoodFormState> emit) {
    final selectedMap =
        event.isVeg ? state.vegItemsList : state.nonVegItemsList;
    if (selectedMap.containsKey(event.itemName)) {
      emit(state.copyWith(isVegChecked: event.isVeg, isEditing: true));
    }
  }

  void _cancelEditing(CancelEditing event, Emitter<FoodFormState> emit) {
    emit(state.copyWith(isEditing: false));
  }
}
