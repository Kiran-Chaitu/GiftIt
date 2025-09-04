import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:giftit/data/API_Response/response.dart';
import 'package:giftit/repository/authentication_repos/forget_password/email_forget_pswd_repo.dart';

part 'email_fp_events.dart';
part 'email_fp_states.dart';

class EmailFpMainBloc extends Bloc<EmailEvent, EmailState> {
  final EmailForgetPswdRepository repository;

  EmailFpMainBloc({required this.repository}) : super(const EmailState()) {
    on<SubmitEmail>((event, emit) async {
      emit(state.copyWith(response: const ApiResponse.loading()));
      try {
        final result = await repository.submitEmail(event.email,{
          'Content-Type': 'application/json',
        });
        emit(state.copyWith(response: ApiResponse.success(result)));
        await Future.delayed(const Duration(milliseconds: 200));
        emit(state.copyWith(response: const ApiResponse.initial()));
      } 
      catch (e) {
        emit(state.copyWith(response: ApiResponse.failure(e.toString())));
        await Future.delayed(const Duration(milliseconds: 200));
        emit(state.copyWith(response: const ApiResponse.initial()));
      }
    });
  }              
}
