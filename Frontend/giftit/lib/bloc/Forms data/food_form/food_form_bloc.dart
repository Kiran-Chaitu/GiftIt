import 'package:bloc/bloc.dart';
import 'package:giftit/bloc/Forms%20data/food_form/food_form_event.dart';
import 'package:giftit/bloc/Forms%20data/food_form/food_form_state.dart';

class FoodFormBloc extends Bloc<FoodFormEvent, FoodFormState> {
  FoodFormBloc() : super((FoodFormState())) {
    on<CheckFoodType>(_checkFoodType);
  }

  void _checkFoodType(CheckFoodType event, Emitter<FoodFormState> emit) {
    if(event.type == 'veg') {
      emit(state.copyWith(isVegChecked: !state.isVegChecked ));
    }
    else{
      emit(state.copyWith(isNonVegChecked: !state.isNonVegChecked ));
    }
  }



}
