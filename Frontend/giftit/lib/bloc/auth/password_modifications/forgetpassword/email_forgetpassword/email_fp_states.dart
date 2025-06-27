part of 'email_fp_main_bloc.dart';

class EmailState extends Equatable {
  final ApiResponse<String> response;

  const EmailState({this.response = const ApiResponse.initial()});

  EmailState copyWith({ApiResponse<String>? response}) {
    return EmailState(response: response ?? this.response);
  }

  @override
  List<Object?> get props => [response];
}
