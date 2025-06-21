// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/bloc/auth/signup/signup_main_bloc.dart';
// import 'package:giftit/configs/colors/app_colors.dart';

// class TextfieldSignup extends StatelessWidget {
//   final String type, hintText;
//   final Icon frontIcon;

//   const TextfieldSignup({
//     super.key,
//     required this.type,
//     required this.hintText,
//     required this.frontIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Container(
//       height: size.height / 12,
//       width: (size.width / 3) * 2.5,
//       alignment: Alignment.center,
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         color: AppColors.lightGreen,
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: BlocBuilder<SignupMainBloc, SignupState>(
//         buildWhen: (previous, current) {
//           switch (type) {
//             case "Phone Number":
//               return previous.phoneNumber != current.phoneNumber;
//             case "username":
//               return previous.username != current.username;
//             case "Email":
//               return previous.email != current.email;
//             case "Password":
//               return previous.password != current.password;
//             case "city location":
//               return previous.cityLocation != current.cityLocation;
//             // case "Confirm Password":
//             //   return previous.conformpassword != current.conformpassword;
//             default:
//               return false;
//           }
//         },
//         builder: (context, state) {
//           return TextField(
//             textAlign: TextAlign.center,
//             // border: InputBorder.none,
//             obscureText: type.toLowerCase().contains("password"),
//             decoration: InputDecoration(    
//                border: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               disabledBorder: InputBorder.none,
//               errorBorder: InputBorder.none,
//               focusedErrorBorder: InputBorder.none,
//               contentPadding: EdgeInsets.zero,
//               hintText: hintText,
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: frontIcon,
//               ),
//             ),
//             onChanged: (val) {
//               switch (type) {
//                 case "Phone Number":
//                   context.read<SignupMainBloc>().add(PhoneNumberChanged(val));
//                   break;
//                 case "username":
//                   context.read<SignupMainBloc>().add(UsernameChanged(val));
//                   break;
//                 case "Email":
//                   context.read<SignupMainBloc>().add(EmailChanged(val));
//                   break;
//                 case "Password":
//                   context.read<SignupMainBloc>().add(PasswordChanged(val));
//                   break;
//                 case "city location":
//                   context.read<SignupMainBloc>().add(CityLocationChanged(val));
//                   break;
//                 // case "Confirm Password":
//                 //   context.read<SignupMainBloc>().add(ConfirmPasswordchanged(val));
//                 //   break;
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/signup/signup_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class TextfieldSignup extends StatelessWidget {
  final String type, hintText;
  final Icon frontIcon;

  const TextfieldSignup({
    super.key,
    required this.type,
    required this.hintText,
    required this.frontIcon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 12,
      width: (size.width / 3) * 2.5,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(50),
      ),
      child: BlocBuilder<SignupMainBloc, SignupState>(
        buildWhen: (previous, current) {
          if (type == "Password") {
            return previous.password != current.password || previous.obscurePassword != current.obscurePassword;
          }
          switch (type) {
            case "Phone Number":
              return previous.phoneNumber != current.phoneNumber;
            case "username":
              return previous.username != current.username;
            case "Email":
              return previous.email != current.email;
            case "city location":
              return previous.cityLocation != current.cityLocation;
            default:
              return false;
          }
        },
        builder: (context, state) {
          return TextField(
            textAlign: TextAlign.center,
            obscureText: type == "Password" ? state.obscurePassword : false,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: frontIcon,
              ),
              suffixIcon: type == "Password"
                  ? IconButton(
                      icon: Icon(
                        state.obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey[700],
                      ),
                      onPressed: () {
                        context.read<SignupMainBloc>().add(PasswordVisibilityToggled());
                      },
                    )
                  : null,
            ),
            onChanged: (val) {
              switch (type) {
                case "Phone Number":
                  context.read<SignupMainBloc>().add(PhoneNumberChanged(val));
                  break;
                case "username":
                  context.read<SignupMainBloc>().add(UsernameChanged(val));
                  break;
                case "Email":
                  context.read<SignupMainBloc>().add(EmailChanged(val));
                  break;
                case "Password":
                  context.read<SignupMainBloc>().add(PasswordChanged(val));
                  break;
                case "city location":
                  context.read<SignupMainBloc>().add(CityLocationChanged(val));
                  break;
              }
            },
          );
        },
      ),
    );
  }
}
