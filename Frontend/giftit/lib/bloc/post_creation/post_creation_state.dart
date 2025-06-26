import 'package:equatable/equatable.dart';

class PostCreationState extends Equatable {
  final String selectedCategory;

  const PostCreationState({
    this.selectedCategory = 'Food',
  });

  PostCreationState copyWith({
    String? selectedCategory,
  }) {
    return PostCreationState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props =>
      [selectedCategory];
}
