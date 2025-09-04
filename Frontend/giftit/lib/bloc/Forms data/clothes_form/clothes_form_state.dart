import 'package:equatable/equatable.dart';

class ClothesFormState extends Equatable {
  final String name;
  final String quantity;
  final String gender;
  final String size;
  final List<Map<String, String>> clothesList;
  final bool isEditing;
  final int? editingIndex;

  const ClothesFormState({
    this.name = '',
    this.quantity = '',
    this.gender = 'Male',
    this.size = '',
    this.clothesList = const [],
    this.isEditing = false,
    this.editingIndex,
  });

  ClothesFormState copyWith({
    String? name,
    String? quantity,
    String? gender,
    String? size,
    List<Map<String, String>>? clothesList,
    bool? isEditing,
    int? editingIndex,
  }) {
    return ClothesFormState(
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      gender: gender ?? this.gender,
      size: size ?? this.size,
      clothesList: clothesList ?? this.clothesList,
      isEditing: isEditing ?? this.isEditing,
      editingIndex: editingIndex ?? this.editingIndex,
    );
  }

  static ClothesFormState initial() => const ClothesFormState();

  @override
  List<Object?> get props => [
        name,
        quantity,
        gender,
        size,
        clothesList,
        isEditing,
        editingIndex,
      ];
}
