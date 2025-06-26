import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/models/profile/profileModell.dart';


//profile page
class ProfileState extends Equatable {
  final ApiResponse<ProfileModel> profileApiResponse;
  final bool isSubmiting;

  const ProfileState({
    this.profileApiResponse = const ApiResponse.loading(),
    this.isSubmiting = false,
  });

  ProfileState copyWith({
    ApiResponse<ProfileModel>? profileApiResponse,
    bool? isSubmiting
  }) {
    return ProfileState(
      profileApiResponse: profileApiResponse ?? this.profileApiResponse,
      isSubmiting : isSubmiting ?? this.isSubmiting
    );
  }

  @override
  List<Object> get props => [profileApiResponse , isSubmiting];
}


