// part of 'api_data_bloc.dart';
// abstract class DataState{}

// class Dataintial extends DataState{}

// class DataLoading extends DataState{}

// class DataLoaded extends DataState{
//   final String data;
//   DataLoaded(this.data);
// }
// class DataError extends DataState{
//   final String mssg;
//   DataError(this.mssg);
// }


part of 'ngo_desc_main_bloc.dart';

class NgoDescState extends Equatable {
  final Status status;
  final ApiResponse<NgoDescModel> data;
  final String? message;

  const NgoDescState({
    this.status = Status.loading,
    this.data = const ApiResponse.loading(),
    this.message,
  });

  NgoDescState copyWith({
    Status? status,
    ApiResponse<NgoDescModel>? data,
    String? message,
  }) {
    return NgoDescState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, data, message];
}
