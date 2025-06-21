import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/repository/authentication_repos/signup_repo.dart';

part 'signup_events.dart';
part 'signup_states.dart';
part 'signup_status.dart';

class SignupMainBloc extends Bloc<SignupEvent,SignupState>{
  SignupRepository _signupRepository=SignupRepository();
  SignupMainBloc():super(const SignupState()){
    on<UsernameChanged>(_onUsernameChanged);
    on<PhoneNumberChanged>(_phoneNumberChanged);
    on<EmailChanged>(_onEmailChanged);    
    on<CityLocationChanged>(_cityLocationChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordchanged>(_onConfirmPasswordChanged);
    on<SignupApi>(_signupApi);
  }
  void _onUsernameChanged(UsernameChanged event,Emitter<SignupState>emit){
    debugPrint(event.username);
    emit(
      state.copyWith(username:event.username),
    );
  }
  void _phoneNumberChanged(PhoneNumberChanged event,Emitter<SignupState>emit){
    debugPrint(event.phoneNumber);
    emit(
      state.copyWith(phoneNumber:event.phoneNumber),
    );
  }
  void _onEmailChanged(EmailChanged event,Emitter<SignupState>emit){
    debugPrint(event.email);
    emit(
      state.copyWith(email:event.email),
    );
  }
  void _cityLocationChanged(CityLocationChanged event,Emitter<SignupState>emit){
    debugPrint(event.cityLocation);
    emit(
      state.copyWith(cityLocation:event.cityLocation),
    );
  }
  void _onPasswordChanged(PasswordChanged event, Emitter<SignupState>emit){
    debugPrint(event.password);
    emit(
      state.copyWith(password:event.password),
    );
  }
  void _onConfirmPasswordChanged(ConfirmPasswordchanged event, Emitter<SignupState>emit){
    debugPrint(event.conformpassword);
    emit(
      state.copyWith(conformpassword:event.conformpassword),
    );
  }
  void _signupApi(SignupApi event,Emitter<SignupState>emit) async {
    emit(state.copyWith(signupstatus: SignupStatus.loading));
    Map data ={'email':state.email, "password":state.password};
    // emit(state.copyWith(loginstatus: Loginstatus.loading));
    // await loginRepository.loginApi(data).
    //   then((val){
    //     //success
    //     if(val.token !=null && val.token!.isNotEmpty){  
    //       emit(
    //         state.copyWith(
    //           loginstatus: Loginstatus.success,
    //           message:'Login Successful'
    //         ),
    //       );
    //     }
    //     else {//failure
    //       emit(
    //         state.copyWith(
    //           loginstatus: Loginstatus.fail,
    //           message: 'Invalid credentials',
    //         )
    //       );
    //     }
    //   });      
  }
}


