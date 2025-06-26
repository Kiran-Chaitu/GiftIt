import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../models/profile/profileModell.dart';

  abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfileEvent extends ProfileEvent{}

class EditProfileEvent extends ProfileEvent{
    final String name ;
   final String number;
   final String location;
    final File image ;

    const EditProfileEvent({required this.name,required this.number,required this.location,required this.image,});

    @override
  List<Object> get props => [name , number , location , image];

}
