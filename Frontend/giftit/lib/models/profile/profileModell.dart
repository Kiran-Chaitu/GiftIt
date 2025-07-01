class ProfileModel {
  final int userId;
  final String displayName;
  final String? profilePhotoUrl;
  final String location;
  final String mobileNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileModel({
    required this.userId,
    required this.displayName,
    this.profilePhotoUrl,
    required this.location,
    required this.mobileNumber,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final data = json['response'];
    return ProfileModel(
      userId: data['user_id'],
      displayName: data['user_name'],
      profilePhotoUrl: data['profile_photo_url'],
      location: data['user_location'] ?? '',
      mobileNumber: data['mobile_number'] ?? '',
      createdAt: DateTime.parse(data['created_at']),
      updatedAt: DateTime.parse(data['updated_at']),
    );
  }


  /// Use this only when sending data to the edit profile API
  Map<String, dynamic> toUpdateJson() {
    return {
      "user_id": userId,
      "display_name": displayName,
      "location": location,
      "mobile_number": mobileNumber,
      // Don't send profile_photo_url, createdAt, updatedAt unless needed
    };
  }

  /// Keep this only if needed for full model serialization
  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "display_name": displayName,
      "profile_photo_url": profilePhotoUrl,
      "location": location,
      "mobile_number": mobileNumber,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
    };
  }
}
