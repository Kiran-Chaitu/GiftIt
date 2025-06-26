import 'package:equatable/equatable.dart';

abstract class PostCreationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeCategory extends PostCreationEvent {
  final String selectedCategory;

  ChangeCategory({required this.selectedCategory});

  @override
  List<Object?> get props => [selectedCategory];
  
}
