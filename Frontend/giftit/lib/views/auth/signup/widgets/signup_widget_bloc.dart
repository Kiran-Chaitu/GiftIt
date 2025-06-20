import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/authe/signup/signup_main_bloc.dart';
import 'package:giftit/views/auth/signup/widgets/textfield_signup.dart';
import 'package:giftit/views/auth/validations/auth_validations.dart';

class SignupSceenBloc extends StatelessWidget {
  const SignupSceenBloc({super.key});  
  @override
  Widget build(BuildContext context) {
        
    return 
    // BlocProvider(
    //   create: (_) => LoginBloc(),
      // child: 
      SingleChildScrollView(
          child: BlocConsumer<SignupMainBloc, SignupState>(
            listener: (context, state) {
              if(state.signupstatus==SignupStatus.fail) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } 
              else if(state.signupstatus==SignupStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message, style: TextStyle(color: Colors.green)),
                  ),
                );                
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextfieldSignup(
                      type: "username",
                      hintText: "Full Name",
                      frontIcon: Icon(Icons.person),
                    ),
                    const SizedBox(height: 20),
                    TextfieldSignup(
                      type: "Phone Number",
                      hintText: "Phone Number",
                      frontIcon: Icon(Icons.phone),
                    ),
                    const SizedBox(height: 20),
                    TextfieldSignup(
                      type: "Email",
                      hintText: "giftit36@gmail.com",
                      frontIcon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 20),
                    TextfieldSignup(
                      type: "city location",
                      hintText: "City Location",
                      frontIcon: Icon(Icons.location_city),
                    ),
                    const SizedBox(height: 20),
                    TextfieldSignup(
                      type: "Password",
                      hintText: "Password",
                      frontIcon: Icon(Icons.lock),
                    ),
                    const SizedBox(height: 30),
                    // BlocBuilder<SignupMainBloc, SignupState>(
                    //   buildWhen: (previous, current) => previous.username != current.username,
                    //   builder: (context, state) {
                    //     return PasswordMailTextfield(type: "username",hintText: "full name",);
                    //   },
                    // ),   
                    // const SizedBox(height: 20,) ,                
                    // BlocBuilder<SignupMainBloc, SignupState>(
                    //   buildWhen: (previous, current) => previous.phoneNumber != current.phoneNumber,
                    //   builder: (context, state) {
                    //     return TextfieldSignup(type: "Phone Number",hintText: "Phone NUmber",frontIcon: Icon(Icons.email),);
                    //   },
                    // ),                    
                    // const SizedBox(height: 20),
                    // BlocBuilder<SignupMainBloc, SignupState>(
                    //   buildWhen: (previous, current) => previous.email != current.email,
                    //   builder: (context, state) {
                    //     return PasswordMailTextfield(type: "Email",hintText: "giftit36@gmail.com",);
                    //   },
                    // ),                    
                    // const SizedBox(height: 20),
                    // BlocBuilder<SignupMainBloc, SignupState>(
                    //   buildWhen: (previous, current) => previous.cityLocation != current.cityLocation,
                    //   builder: (context, state) {
                    //     return PasswordMailTextfield(type: "city location",hintText: "city location",);
                    //   },
                    // ),                    
                    // const SizedBox(height: 20),
                    // BlocBuilder<SignupMainBloc, SignupState>(
                    //   buildWhen: (previous, current) => previous.password != current.password,
                    //   builder: (context, state) {
                    //     return PasswordMailTextfield(type: "Password",hintText: "Password",);
                    //   },
                    // ),                    
                    // const SizedBox(height: 20),
                    
                    state.signupstatus==SignupStatus.loading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              final currentState = context.read<SignupMainBloc>().state;
                              debugPrint("Signup Button Pressed");
                              // final currentState = context.watch<SignupMainBloc>().state;                                                                                          

                              String mssg=ValidationsOfAuth.signupValidation(currentState);
                              if(mssg.isNotEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(mssg , style: TextStyle(color: Colors.red),))
                                );
                                return ;
                              }
                              // if(!patternMatchAndSnackBar(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$', currentState.password, "Enter Strong Password" , context))return;
                              context.read<SignupMainBloc>().add(SignupApi());
                            },
                            child: Text("Signup"),
                          ),                          
                      
                  ],
                ),
              );
            },
          ),
        );
    // );
  }
  
}