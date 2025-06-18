// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:giftit/bloc/login_bloc/login_main_bloc.dart';


// // class LoginScreen extends StatelessWidget {
// //   const LoginScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => LoginBloc(),
// //       child: Scaffold(
// //         appBar: AppBar(title: Text('Login')),
// //         body: BlocConsumer<LoginBloc, LoginState>(
// //           listener: (context, state) {
// //             if (state.status == LoginStatus.failure) {
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text("Login failed!")),
// //               );
// //             } else if (state.status == LoginStatus.success) {
// //               // Navigator.push(
// //                 // context,
// //                 // MaterialPageRoute(builder: (_) => SuccessScreen()),
// //               // );
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text("Login Success",style: TextStyle(color: Colors.green),)),
// //               );
// //             }
// //           },
// //           builder: (context, state) {
// //             return Padding(
// //               padding: const EdgeInsets.all(20.0),
// //               child: Column(
// //                 children: [
// //                   TextField(
// //                     decoration: InputDecoration(labelText: "Email"),
// //                     onChanged: (val) => context.read<LoginBloc>().add(EmailChanged(val)),
// //                   ),
// //                   SizedBox(height: 16),
// //                   TextField(
// //                     decoration: InputDecoration(labelText: "Password"),
// //                     obscureText: true,
// //                     onChanged: (val) => context.read<LoginBloc>().add(PasswordChanged(val)),
// //                   ),
// //                   SizedBox(height: 32),
// //                   state.isLoading
// //                       ? CircularProgressIndicator()
// //                       : ElevatedButton(
// //                           onPressed: () {
// //                             final state =context.read<LoginBloc>().state;
// //                              if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',).hasMatch(state.email)){
// //                               ScaffoldMessenger.of(context).showSnackBar(
// //                                 SnackBar(content: Text("Enter valid email" , style: TextStyle(color: Colors.red),))
// //                               );
// //                               return ;
// //                              }
// //                              if(!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$').hasMatch(state.password)){
// //                               ScaffoldMessenger.of(context).showSnackBar(
// //                                 SnackBar(content: Text("Enter Strong Password" , style: TextStyle(color: Colors.red),))
// //                               );
// //                               return ;
// //                              }
// //                             context.read<LoginBloc>().add(LoginSubmitted());
// //                           },
// //                           child: Text("Login"),
// //                         )
// //                 ],
// //               ),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:giftit/configs/colors/app_colors.dart';
// import 'package:giftit/views/login/widgets/login_screen_bloc.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LoginBloc(),
//       child: Scaffold(
//         appBar: AppBar(title: Text('Login')),
//         body: BlocConsumer<LoginBloc, LoginState>(
//           listener: (context, state) {
//             if (state.status == LoginStatus.failure) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Login failed!")),
//               );
//             } else if (state.status == LoginStatus.success) {
//               // Navigator.push(
//                 // context,
//                 // MaterialPageRoute(builder: (_) => SuccessScreen()),
//               // );
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Login Success",style: TextStyle(color: Colors.green),)),
//               );
//             }
//           },
//           builder: (context, state) {
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(labelText: "Email"),
//                     onChanged: (val) => context.read<LoginBloc>().add(EmailChanged(val)),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     decoration: InputDecoration(labelText: "Password"),
//                     obscureText: true,
//                     onChanged: (val) => context.read<LoginBloc>().add(PasswordChanged(val)),
//                   ),
//                   SizedBox(height: 32),
//                   state.isLoading
//                       ? CircularProgressIndicator()
//                       : ElevatedButton(
//                           onPressed: () {
//                             final state =context.read<LoginBloc>().state;
//                              if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',).hasMatch(state.email)){
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("Enter valid email" , style: TextStyle(color: Colors.red),))
//                               );
//                               return ;
//                              }
//                              if(!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]{8,}$').hasMatch(state.password)){
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("Enter Strong Password" , style: TextStyle(color: Colors.red),))
//                               );
//                               return ;
//                              }
//                             context.read<LoginBloc>().add(LoginSubmitted());
//                           },
//                           child: Text("Login"),
//                         )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/login/widgets/login_screen_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size siz=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink,
      // appBar: AppBar(title: Text('Giftit')),
      body: Stack(
        children: [
          Positioned(
            top:0,left: 0,
            child: SizedBox(height: siz.height/5,),
          ),
          Positioned(
            top:siz.height/6 ,
            child: Container(
              height: (siz.height/6)*5,
              width: siz.width,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Back",textAlign: TextAlign.left,),
                  SizedBox(height: 30,),
                  LoginScreenWithBloc(),
                ],
              ),
            ),
          )
        ],
      ),
      
    );
  }
}
