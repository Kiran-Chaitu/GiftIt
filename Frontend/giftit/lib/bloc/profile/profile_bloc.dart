import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/repository/profile_repos/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository;

  ProfileBloc({required this.repository}) : super(ProfileState()) {
    on<LoadProfileEvent>(_onLoadProfileEvent);
    on<EditProfileEvent>(_onEditProfileEvent);
  }

  void _onLoadProfileEvent(
      LoadProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(
      profileApiResponse: const ApiResponse.loading(),
    ));
    try {
      final profileResponse = await repository.fetchProfileData();
      debugPrint('Hitted the profile API');
      emit(state.copyWith(
        profileApiResponse: profileResponse,
      ));
    } catch (e) {
      emit(state.copyWith(
        profileApiResponse: ApiResponse.failure(e.toString()),
      ));
    }
  }

  void _onEditProfileEvent(
      EditProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(isSubmiting: true));

    try {
      final editProfileResponse = await repository.editProfileData(
          event.name, event.number, event.location, event.image);
      emit(state.copyWith(
        isSubmiting: false,
      ));
    } catch (e) {
      emit(state.copyWith(isSubmiting: false));
    }
  }
}
