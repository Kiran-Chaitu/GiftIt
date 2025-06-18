import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/login_bloc/login_main_bloc.dart';
import 'package:giftit/views/login/widgets/password_Mail_TextField.dart';
import 'package:giftit/views/login/widgets/patternMatching.dart';
import 'package:giftit/views/login/widgets/text_log_sign_navigator.dart';

class LoginScreenWithBloc extends StatelessWidget {
  const LoginScreenWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    // Size siz=MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Login failed!")),
                );
              } else if (state.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Login Success", style: TextStyle(color: Colors.green)),
                  ),
                );
                // Optionally navigate to another screen
                // Navigator.push(context, MaterialPageRoute(builder: (_) => SuccessScreen()));
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PasswordMailTextfield(context: context, isMail: true),
                    // Container(
                    //   height: siz.height/10,
                    //   width: (siz.width/3)*2,
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     color:AppColors.lightGreen,
                    //     borderRadius: BorderRadius.circular(50),
                    //   ),
                    //   child: TextField(
                    //     decoration: InputDecoration(hintText: "Email",border: InputBorder.none),
                    //     onChanged: (val) =>
                    //         context.read<LoginBloc>().add(EmailChanged(val)),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    // TextField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(labelText: "Password"),
                    //   onChanged: (val) =>
                    //       context.read<LoginBloc>().add(PasswordChanged(val)),
                    // ),
                    PasswordMailTextfield(context: context, isMail: false),
                    SizedBox(height: 10,),
                    TextLogSignNavigator(text: "signup?", callBackFunction: ()=>{}),
                    SizedBox(height: 32),
                    state.isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              final currentState = context.read<LoginBloc>().state;                            
                              //  if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',).hasMatch(currentState.email)){
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(content: Text("Enter valid email" , style: TextStyle(color: Colors.red),))
                              //   );
                              //   return ;
                              //  }
                                if(!patternMatchAndSnackBar(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', currentState.email, "Enter valid email" , context))return;
                                // if(!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$').hasMatch(currentState.password)){
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(content: Text("Enter Strong Password" , style: TextStyle(color: Colors.red),))
                                // );
                              //   return ;
                              // }
                                if(!patternMatchAndSnackBar(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$', currentState.password, "Enter Strong Password" , context))return;
          
                              context.read<LoginBloc>().add(LoginSubmitted());
                            },
                            child: Text("Login"),
                          ),
                          TextLogSignNavigator(text: "signup?", callBackFunction: ()=>{}),
                      
                  ],
                ),
              );
            },
          ),
        ),      
    );
  }
  
}