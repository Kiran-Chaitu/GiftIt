import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class NgoRegistrationEvent extends Equatable {

  const NgoRegistrationEvent();

  @override
  List<Object> get props => [];

}

class SubmitNgoDetails extends NgoRegistrationEvent {
  final String ngoId;
  final String ngoName;
  final String ngoAddress;

  const SubmitNgoDetails({
    required this.ngoId,
    required this.ngoName,
    required this.ngoAddress,

  });

  @override
  List<Object> get props => [ngoId, ngoName, ngoAddress, ];
}
