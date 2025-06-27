import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/status.dart';

class PostCreationState extends Equatable {
  final String selectedCategory;
  final Status status;

  const PostCreationState({
    this.selectedCategory = 'Food',
    this.status = Status.initial,
  });

  PostCreationState copyWith({
    String? selectedCategory,
    Status? status,
  }) {
    return PostCreationState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props =>
      [selectedCategory , status];
}
