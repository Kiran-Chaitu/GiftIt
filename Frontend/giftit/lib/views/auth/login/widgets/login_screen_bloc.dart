import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/bloc/authe/login_bloc/loginStatus.dart';
import 'package:giftit/bloc/authe/login_bloc/login_main_bloc.dart';
import 'package:giftit/views/auth/login/widgets/password_Mail_TextField.dart';
import 'package:giftit/views/auth/validations/auth_validations.dart';
import 'package:giftit/views/auth/login/widgets/text_log_sign_navigator.dart';

class LoginScreenWithBloc extends StatelessWidget {
  const LoginScreenWithBloc({super.key});  
  @override
  Widget build(BuildContext context) {
        
    return 
    // BlocProvider(
    //   create: (_) => LoginBloc(),
      // child: 
      SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if(state.loginstatus==Loginstatus.fail) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } 
              else if(state.loginstatus==Loginstatus.success) {
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
                    BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) => previous.email != current.email,
                      builder: (context, state) {
                        return PasswordMailTextfield(type: "Email",hintText: "Email",);
                      },
                    ),
                    
                    const SizedBox(height: 20),
                    
                     BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (previous, current) => previous.password != current.password,
                      builder: (context, state) {
                        return PasswordMailTextfield(type: "Password" ,hintText: "Password",);
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextLogSignNavigator(text: "forget password", callBackFunction: ()=>{}),
                    SizedBox(height: 20,),
                    TextLogSignNavigator(text: "signup?",frontText :"didn't have account ", callBackFunction: ()=>{}),
                    SizedBox(height: 32),
                    state.loginstatus==Loginstatus.loading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              final currentState = context.read<LoginBloc>().state;                                                                                        
                                String mssg=ValidationsOfAuth.loginValidation(currentState);
                                if(mssg.isNotEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(mssg , style: TextStyle(color: Colors.red),))
                                  );
                                  return ;
                                }
                                
          
                              context.read<LoginBloc>().add(LoginApi());
                            },
                            child: Text("Login"),
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