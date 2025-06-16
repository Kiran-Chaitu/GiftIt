import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_event.dart';
part 'data_state.dart';


class ApiDataBloc extends Bloc<DataEvent,DataState> {
  ApiDataBloc():super(Dataintial()){
    on<FetchData>((event, emit) async{
      emit(DataLoading());
      try{
        await Future.delayed(Duration(seconds: 2));
        final apiResponse='data from api';
        emit(DataLoaded(apiResponse));
      }
      catch(e){
        emit(DataError("Data Fetching Error"));
      }
    });
  }
}