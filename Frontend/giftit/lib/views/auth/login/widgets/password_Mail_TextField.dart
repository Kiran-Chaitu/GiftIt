// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/bloc/auth/login_bloc/login_main_bloc.dart';
// import 'package:giftit/configs/colors/app_colors.dart';

// class PasswordMailTextfield extends StatelessWidget {
//   // final BuildContext context;  
//   final String hintText,type;
//   const PasswordMailTextfield({
//     super.key,
//     // required this.context,
    
//     required this.type,
//     required this.hintText,
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
//                 (type=="Email")?
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
import 'package:giftit/bloc/auth/login_bloc/login_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class PasswordMailTextfield extends StatelessWidget {
  final String hintText, type;
  const PasswordMailTextfield({
    super.key,
    required this.type,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    Size siz = MediaQuery.of(context).size;
    final isPassword = type.toLowerCase() == "password";

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.isPasswordVisible != current.isPasswordVisible,
      builder: (context, state) {
        return Container(
          height: siz.height / 12,
          width: (siz.width / 3) * 2.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.lightGreen,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextField(
            obscureText: isPassword ? !state.isPasswordVisible : false,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              prefixIcon: Icon(
                isPassword ? Icons.lock : Icons.email,
                color: Colors.black54,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        state.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        context.read<LoginBloc>().add(TogglePasswordVisibility());
                      },
                    )
                  : null,
            ),
            onChanged: (val) => isPassword
                ? context.read<LoginBloc>().add(PasswordChanged(val))
                : context.read<LoginBloc>().add(EmailChanged(val)),
          ),
        );
      },
    );
  }
}