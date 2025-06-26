import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/post_creation/post_creation_event.dart';
import 'package:giftit/bloc/post_creation/post_creation_state.dart';

class PostCreationBloc extends Bloc<PostCreationEvent, PostCreationState> {
  
  PostCreationBloc() : super(const PostCreationState()) {
      on<ChangeCategory>(_changeCategory);
  }

  Future<void> _changeCategory(
      ChangeCategory event, Emitter<PostCreationState> emit) async {
    emit(state.copyWith(selectedCategory: event.selectedCategory));
  }
  
}