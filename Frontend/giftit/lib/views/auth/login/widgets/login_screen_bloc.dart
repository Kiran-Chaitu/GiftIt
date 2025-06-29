// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:giftit/bloc/authe/login_bloc/loginStatus.dart';
// import 'package:giftit/bloc/auth/login_bloc/login_main_bloc.dart';
// import 'package:giftit/views/auth/login/widgets/password_Mail_TextField.dart';
// import 'package:giftit/views/auth/validations/auth_validations.dart';
// import 'package:giftit/views/auth/login/widgets/text_log_sign_navigator.dart';

// class LoginScreenWithBloc extends StatelessWidget {
//   const LoginScreenWithBloc({super.key});  
//   @override
//   Widget build(BuildContext context) {
        
//     return 
//     // BlocProvider(
//     //   create: (_) => LoginBloc(),
//       // child: 
//       SingleChildScrollView(
//           child: BlocConsumer<LoginBloc, LoginState>(
//             listener: (context, state) {
//               if(state.loginstatus==Loginstatus.fail) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text(state.message)),
//                 );
//               } 
//               else if(state.loginstatus==Loginstatus.success) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(state.message, style: TextStyle(color: Colors.green)),
//                   ),
//                 );
                
//               }
//             },
//             builder: (context, state) {
//               return Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     BlocBuilder<LoginBloc, LoginState>(
//                       buildWhen: (previous, current) => previous.email != current.email,
//                       builder: (context, state) {
//                         return PasswordMailTextfield(type: "Email",hintText: "Email",);
//                       },
//                     ),
                    
//                     const SizedBox(height: 20),
                    
//                      BlocBuilder<LoginBloc, LoginState>(
//                       buildWhen: (previous, current) => previous.password != current.password,
//                       builder: (context, state) {
//                         return PasswordMailTextfield(type: "Password" ,hintText: "Password",);
//                       },
//                     ),
//                     const SizedBox(height: 10,),
//                     TextLogSignNavigator(text: "forget password", callBackFunction: ()=>{}),
//                     SizedBox(height: 20,),
//                     TextLogSignNavigator(text: "signup?",frontText :"didn't have account ", callBackFunction: ()=>{}),
//                     SizedBox(height: 32),
//                     state.loginstatus==Loginstatus.loading
//                         ? CircularProgressIndicator()
//                         : ElevatedButton(
//                             onPressed: () {
//                               final currentState = context.read<LoginBloc>().state;                                                                                        
//                                 String mssg=ValidationsOfAuth.loginValidation(currentState);
//                                 if(mssg.isNotEmpty){
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text(mssg , style: TextStyle(color: Colors.red),))
//                                   );
//                                   return ;
//                                 }
                                
          
//                               context.read<LoginBloc>().add(LoginApi());
//                             },
//                             child: Text("Login"),
//                           ),                          
                      
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//     // );
//   }
  
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/login_bloc/login_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/auth/login/widgets/password_Mail_TextField.dart';
import 'package:giftit/views/auth/validations/auth_validations.dart';
import 'package:giftit/views/auth/login/widgets/text_log_sign_navigator.dart';
import 'package:giftit/views/widgets/custom_loader.dart';

class LoginScreenWithBloc extends StatelessWidget {
  const LoginScreenWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<LoginBloc, LoginState>(
        // listener: (context, state) {
        //   final loginStatus = state.loginApiResponse.status;
        //   final message = state.loginApiResponse.message ?? '';
        //   final data = state.loginApiResponse.data;

        //   if (loginStatus == Status.success && data?.statusCode == 403) {
        //     debugPrint("Redirecting to OTP");
        //     Navigator.pushNamed(context, RoutesNames.otp, arguments: state.email);
        //   }

        //   else if (loginStatus == Status.success) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text(message, style: const TextStyle(color: Colors.green))),
        //     );
        //     Future.delayed(const Duration(milliseconds: 200), () {
        //       Navigator.pushNamed(context, RoutesNames.home);
        //     });
        //   } else if (loginStatus == Status.failure) {
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
        //   }
        // },
        listener: (context, state) {
          final loginStatus = state.loginApiResponse.status;
          final message = state.loginApiResponse.message ?? '';
          final user = state.loginApiResponse.data;

          if (loginStatus == Status.success) {
            // Navigate to OTP for either status 403 or token present
            if (user?.statusCode == 403 ) {
              debugPrint("Navigating to OTP: statusCode=${user?.statusCode}, token=${user?.token}");
              Navigator.pushReplacementNamed(
                context,
                RoutesNames.otp,
                arguments: {
                  'email':state.email,
                  'type':"authVerification"
                }
              );
            } else {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text(message, style: const TextStyle(color: Colors.green))),
              // );
              Navigator.pushNamed(
                context,
                RoutesNames.home,
                // RoutesNames.oldPassword,
              );
            }
          } else if (loginStatus == Status.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
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
                    return const PasswordMailTextfield(type: "Email", hintText: "Email");
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => previous.password != current.password,
                  builder: (context, state) {
                    return const PasswordMailTextfield(type: "Password", hintText: "Password");
                  },
                ),
                const SizedBox(height: 10),
                TextLogSignNavigator(
                  text: "forget password", callBackFunction: () {
                    Navigator.pushNamed(context, RoutesNames.forgetPswdEmail);
                  }
                ),
                const SizedBox(height: 20),
                TextLogSignNavigator(
                    text: "signup?",
                    frontText: "didn't have account ",
                    callBackFunction: () {
                      Navigator.pushNamed(context, RoutesNames.signup);
                    }),
                const SizedBox(height: 32),
                state.loginApiResponse.status == Status.loading
                    ? const CustomLoader()
                    : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                        elevation: 6,
                        shadowColor: Colors.greenAccent,
                      ),
                        onPressed: () {
                          final currentState = context.read<LoginBloc>().state;
                          final validationMessage = ValidationsOfAuth.loginValidation(currentState);

                          if (validationMessage.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  validationMessage,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                            return;
                          }

                          context.read<LoginBloc>().add(LoginApiCalled());
                        },
                        child: const Text("Login"),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
