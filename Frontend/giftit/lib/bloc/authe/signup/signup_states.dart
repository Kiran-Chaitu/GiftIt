part of 'signup_main_bloc.dart';

class SignupState extends Equatable{
  final String username,email,phoneNumber,password,cityLocation,message,conformpassword;
  final SignupStatus signupstatus; 
  const SignupState({
    this.username='',
    this.email='',
    this.phoneNumber='',
    this.cityLocation='',
    this.password='',
    this.conformpassword='',
    this.signupstatus=SignupStatus.initial,
    this.message='',
  });
  //this will new instance of SignupState
  SignupState copyWith({
    String? username,
    String? phoneNumber,
    String? email,
    String? password,
    String? conformpassword,
    String? cityLocation,
    SignupStatus? signupstatus,
    String? message,
  }){
    return SignupState(
      username: username??this.username,
      phoneNumber:phoneNumber??this.phoneNumber,
      email: email??this.email,
      cityLocation: cityLocation??this.cityLocation,
      password: password ?? this.password,
      signupstatus: signupstatus ?? this.signupstatus,
      message:message ?? this.message,
    );
  }
  @override
  List<Object> get props=>[
      username,email, phoneNumber,cityLocation,password,message,
      signupstatus,
    ];
}