part of 'api_data_bloc.dart';
abstract class DataState{}

class Dataintial extends DataState{}

class DataLoading extends DataState{}

class DataLoaded extends DataState{
  final String data;
  DataLoaded(this.data);
}
class DataError extends DataState{
  final String mssg;
  DataError(this.mssg);
}