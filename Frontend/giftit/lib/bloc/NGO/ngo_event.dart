import 'package:equatable/equatable.dart';

abstract class NgoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadNearbyNgos extends NgoEvent {}


class RefreshNearbyNgos extends NgoEvent {}

class SearchSuggestions extends NgoEvent {
  final String input;

  SearchSuggestions(this.input);

  @override
  List<Object?> get props => [input];
}

class SearchResults extends NgoEvent {}

