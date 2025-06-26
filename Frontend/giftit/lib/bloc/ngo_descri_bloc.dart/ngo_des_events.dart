part of 'ngo_desc_main_bloc.dart';

abstract class NgoDescEvent extends Equatable {
  const NgoDescEvent();

  @override
  List<Object> get props => [];
}

class FetchNgoDescription extends NgoDescEvent {}
