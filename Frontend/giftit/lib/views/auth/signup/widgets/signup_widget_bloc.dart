import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/signup/signup_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/auth/signup/widgets/textfield_signup.dart';
import 'package:giftit/views/auth/validations/auth_validations.dart';
import 'package:giftit/views/widgets/custom_loader.dart';

class SignupScreenBloc extends StatelessWidget {
  const SignupScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupMainBloc, SignupState>(
      // listener: (context, state) {
      //   final status = state.signupApiResponse.status;
      //   final message = state.signupApiResponse.message ?? '';
    
      //   if (status == Status.failure) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text(message)),
      //     );
      //   } else if (status == Status.success) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(
      //         content: Text(
      //           message,
      //           style: const TextStyle(color: Colors.green),
      //         ),
      //       ),
      //     );
      //     Future.delayed(const Duration(milliseconds: 200), () {
      //       Navigator.pushNamed(
      //         context, RoutesNames.otp,
      //         // arguments:{ 'email':state.email, 'type': "authVerification" }
              
      //           arguments: {
      //             'email':state.email,
      //             'type':"authVerification"
      //           }
      //       );
      //     });
      //   }
      // },
      listener: (context, state) {
        final status = state.signupApiResponse.status;
        final message = state.signupApiResponse.message ?? '';
        final signupData = state.signupApiResponse.data;
        // debugPrint("listener data: $status, $message, $signupData");
        if (status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        } 
        else if (status == Status.success && signupData != null) {
          final statusCode = signupData.statusCode;
          debugPrint("Status Code in listener: $statusCode");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          
          if (statusCode == 201) {
            Navigator.pushNamed(
              context,
              RoutesNames.otp,
              arguments: {
                'email': state.email,
                'type': "authVerification",
              },
            );
          } 
          else if (statusCode == 403) {
            Navigator.pushNamed(context, RoutesNames.login);
          } 
          // else {
          //   // Optional: show success message for other status codes
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(message)),
          //   );
          // }
        }
      }
      ,
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
                frontIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),
              TextfieldSignup(
                type: "Phone Number",
                hintText: "Phone Number",
                frontIcon: const Icon(Icons.phone),
              ),
              const SizedBox(height: 20),
              TextfieldSignup(
                type: "Email",
                hintText: "giftit36@gmail.com",
                frontIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 20),
              TextfieldSignup(
                type: "city location",
                hintText: "City Location",
                frontIcon: const Icon(Icons.location_city),
              ),
              const SizedBox(height: 20),
              TextfieldSignup(
                type: "Password",
                hintText: "Password",
                frontIcon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 20),
              // TextfieldSignup(
              //   type: "Confirm Password",
              //   hintText: "Confirm Password",
              //   frontIcon: const Icon(Icons.lock_outline),
              // ),
              // const SizedBox(height: 30),
    
              state.signupApiResponse.status == Status.loading
                  ? const CustomLoader()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 6,
                        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                      ),
                      onPressed: () {
                        final currentState =
                            context.read<SignupMainBloc>().state;
    
                        final validationMessage =
                            ValidationsOfAuth.signupValidation(currentState);
    
                        if (validationMessage.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(validationMessage,style: const TextStyle(color: Colors.red),),
                            ),
                          );
                          return;
                        }
                        context.read<SignupMainBloc>().add(SignupApiCalled());
                      },
                      child: const Text("Signup"),
                    ),
            ],
          ),
        );
      },
    );
  }
}
