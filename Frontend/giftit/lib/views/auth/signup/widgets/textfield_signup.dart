// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/bloc/authe/login_bloc/login_main_bloc.dart';
// import 'package:giftit/configs/colors/app_colors.dart';

// class TextfieldSignup extends StatelessWidget {
//   // final BuildContext context;
//   final String type,hintText;
//   final Icon frontIcon;  
//   const TextfieldSignup({
//     super.key,
//     // required this.context,
    
//     required this.type,
//     required this.hintText,
//     required this.frontIcon
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size siz=MediaQuery.of(context).size;
//     return Container(
//         height: siz.height/10,
//         width: (siz.width/3)*2,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color:AppColors.lightGreen,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: 
//           TextField(
//             textAlign: TextAlign.center,
//               decoration: InputDecoration(
//                 hintText:hintText,
//                 border: InputBorder.none
//               ),
//               onChanged: (val) =>
//                 (type=="")?
//                   context.read<LoginBloc>().add(EmailChanged(val))
//                   :
//                   context.read<LoginBloc>().add(PasswordChanged(val)),                
//             ),

//           // (isMail==true)?
//           //   TextField(
//           //     decoration: InputDecoration(hintText: "Email",border: InputBorder.none),
//           //     onChanged: (val) =>
//           //         context.read<LoginBloc>().add(EmailChanged(val)),
//           //   )
//           //   :
//           //   TextField(
//           //     obscureText: true,
//           //     decoration: InputDecoration(labelText: "Password"),
//           //     onChanged: (val) =>
//           //         context.read<LoginBloc>().add(PasswordChanged(val)),
//           //   ),
//       );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/authe/signup/signup_main_bloc.dart';
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
    Size siz = MediaQuery.of(context).size;
    return Container(
      height: siz.height / 10,
      width: (siz.width / 3) * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(50),
      ),
      child: BlocBuilder<SignupMainBloc, SignupState>(
        buildWhen: (previous, current) {
          if (type == "Phone Number") {
            return previous.phoneNumber != current.phoneNumber;
          } else if (type == "username") {
            return previous.username != current.username;
          } else if (type == "Email") {
            return previous.email != current.email;
          } else if (type == "Password") {
            return previous.password != current.password;
          } else if (type == "city location") {
            return previous.cityLocation != current.cityLocation;
          }
          return false;
        },
        builder: (context, state) {
          return TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              // icon: frontIcon,
              prefixIcon:Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 0), 
                child: frontIcon,
              ),
            ),
            onChanged: (val) {
              if (type == "Phone Number") {
                context.read<SignupMainBloc>().add(PhoneNumberChanged(val));
              } else if (type == "username") {
                context.read<SignupMainBloc>().add(UsernameChanged(val));
              } else if (type == "Email") {
                context.read<SignupMainBloc>().add(EmailChanged(val));
              } else if (type == "Password") {
                context.read<SignupMainBloc>().add(PasswordChanged(val));
              } else if (type == "city location") {
                context.read<SignupMainBloc>().add(CityLocationChanged(val));
              }
            },
          );
        },
      ),
    );
  }
}
