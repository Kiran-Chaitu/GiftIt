import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/login_bloc/login_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class PasswordMailTextfield extends StatelessWidget {
  final BuildContext context;
  final bool isMail;
  const PasswordMailTextfield({
    super.key,
    required this.context,
    required this.isMail,
  });

  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    return Container(
        height: siz.height/10,
        width: (siz.width/3)*2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:AppColors.lightGreen,
          borderRadius: BorderRadius.circular(50),
        ),
        child: 
          TextField(
            textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText:(isMail==true)? "Email" : "Password",
                border: InputBorder.none
              ),
              onChanged: (val) =>
                (isMail==true)?
                  context.read<LoginBloc>().add(EmailChanged(val))
                  :
                  context.read<LoginBloc>().add(PasswordChanged(val)),                
            ),

          // (isMail==true)?
          //   TextField(
          //     decoration: InputDecoration(hintText: "Email",border: InputBorder.none),
          //     onChanged: (val) =>
          //         context.read<LoginBloc>().add(EmailChanged(val)),
          //   )
          //   :
          //   TextField(
          //     obscureText: true,
          //     decoration: InputDecoration(labelText: "Password"),
          //     onChanged: (val) =>
          //         context.read<LoginBloc>().add(PasswordChanged(val)),
          //   ),
      );
  }
}