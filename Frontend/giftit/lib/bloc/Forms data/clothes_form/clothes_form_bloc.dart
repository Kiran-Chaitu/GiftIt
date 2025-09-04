import 'package:flutter_bloc/flutter_bloc.dart';
import 'clothes_form_event.dart';
import 'clothes_form_state.dart';

class ClothesFormBloc extends Bloc<ClothesFormEvent, ClothesFormState> {
  ClothesFormBloc() : super(ClothesFormState.initial()) {
    on<UpdateClothesName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<UpdateClothesQuantity>((event, emit) {
      emit(state.copyWith(quantity: event.quantity));
    });

    on<UpdateClothesSize>((event, emit) {
      emit(state.copyWith(size: event.size));
    });

    on<ToggleGender>((event, emit) {
      emit(state.copyWith(gender: event.gender));
    });

    on<AddClothesItem>((event, emit) {
      final newItem = {
        'name': state.name,
        'quantity': state.quantity,
        'size': state.size,
        'gender': state.gender,
      };
      final updatedList = [...state.clothesList, newItem];
      emit(state.copyWith(
        clothesList: updatedList,
        name: '',
        quantity: '',
        size: '',
        gender: 'Male',
      ));
    });

    on<StartEditClothesItem>((event, emit) {
      final item = state.clothesList[event.index];
      emit(state.copyWith(
        name: item['name'] ?? '',
        quantity: item['quantity'] ?? '',
        size: item['size'] ?? '',
        gender: item['gender'] ?? 'Male',
        isEditing: true,
        editingIndex: event.index,
      ));
    });

    on<UpdateClothesItem>((event, emit) {
      final updatedItem = {
        'name': state.name,
        'quantity': state.quantity,
        'size': state.size,
        'gender': state.gender,
      };

      final updatedList = [...state.clothesList];
      if (state.editingIndex != null &&
          state.editingIndex! >= 0 &&
          state.editingIndex! < updatedList.length) {
        updatedList[state.editingIndex!] = updatedItem;
      }

      emit(state.copyWith(
        clothesList: updatedList,
        name: '',
        quantity: '',
        size: '',
        gender: 'Male',
        isEditing: false,
        editingIndex: null,
      ));
    });

    on<DeleteClothesItem>((event, emit) {
      final updatedList = [...state.clothesList]..removeAt(event.index);
      emit(state.copyWith(clothesList: updatedList));
    });

    on<CancelEditingClothesItem>((event, emit) {
      emit(state.copyWith(
        name: '',
        quantity: '',
        size: '',
        gender: 'Male',
        isEditing: false,
        editingIndex: null,
      ));
    });
  }
}
