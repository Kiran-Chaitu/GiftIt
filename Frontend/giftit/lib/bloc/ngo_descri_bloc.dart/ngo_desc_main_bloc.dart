// // import 'package:flutter_bloc/flutter_bloc.dart';

// // part 'data_event.dart';
// // part 'data_state.dart';


// // class ApiDataBloc extends Bloc<DataEvent,DataState> {
// //   ApiDataBloc():super(Dataintial()){
// //     on<FetchData>((event, emit) async{
// //       emit(DataLoading());
// //       try{
// //         await Future.delayed(Duration(seconds: 2));
// //         final apiResponse='data from api';
// //         emit(DataLoaded(apiResponse));
// //       }
// //       catch(e){
// //         emit(DataError("Data Fetching Error"));
// //       }
// //     });
// //   }
// // }


// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:giftit/data/API_Response/response.dart';
// import 'package:giftit/models/ngo_model.dart';
// import 'package:giftit/repository/ngo_repository.dart';
// part 'ngo_des_events.dart';
// part 'ngo_des_state.dart';

// class NgoDescMainBloc extends Bloc<NgoDesEvents, NgoDesState> {
//   final NGORepository repository;
//   NgoDescMainBloc({required this.repository}) : super(NgoDesState()) {
//     on<FetchNgoDesc>(_FetchNgoDescFun());
//   }
  

// void _FetchNgoDescFun(FetchNgoDesc event, Emitter<NgoDesState> emit) async {
//     emit(state.copyWith(dataStatus: Status.loading));
//     try {
//       final ngoResponse = await repository.ngoDescFetch(); 
//       emit(state.copyWith(
//         ngoDesData: 
//         // locationStatus: Status.success,
//         // nearByNgoApiResponse: ngoResponse,
//       ));
//     } check
//     catch (e) {
//       emit(state.copyWith(
//         // locationStatus: Status.failure,
//         // nearByNgoApiResponse: ApiResponse.failure(e.toString()),
//       ));
//     }
//   }

// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/api_response.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/models/ngo_desc_model.dart';
import 'package:giftit/repository/ngo_repository.dart';

part 'ngo_des_events.dart';
part 'ngo_des_state.dart';

class NgoDescBloc extends Bloc<NgoDescEvent, NgoDescState> {
  final NGORepository repository;

  NgoDescBloc({required this.repository}) : super(const NgoDescState()) {
    on<FetchNgoDescription>(_onFetchNgoDescription);
  }

  Future<void> _onFetchNgoDescription(
    FetchNgoDescription event,
    Emitter<NgoDescState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final response = await repository.ngoDescFetch();
      emit(state.copyWith(status: Status.success, data: response));
    } catch (e) {
      emit(state.copyWith(
        status: Status.failure,
        message: e.toString(),
        data: const ApiResponse.failure("Failed to fetch description"),
      ));
    }
  }
}
