// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:giftit/bloc/auth/otp/otp_main_bloc.dart';
// import 'package:giftit/configs/colors/app_colors.dart';
// import 'package:giftit/data/API_Response/status.dart';
// import 'package:giftit/views/widgets/custom_loader.dart';

// class OtpMainScreen extends StatefulWidget {
//   final String email; // or phone, based on your use case
//   const OtpMainScreen({super.key, required this.email});

//   @override
//   State<OtpMainScreen> createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpMainScreen> {
//   final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
//   final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

//   @override
//   void dispose() {
//     for (final node in _focusNodes) {
//       node.dispose();
//     }
//     for (final controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   void _onOtpSubmit(BuildContext context) {
//     String otp = _controllers.map((c) => c.text).join();
//     if (otp.length < 4) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please enter 4-digit OTP")),
//       );
//       return;
//     }

//     context.read<OtpMainBloc>().add(OtpSubmitted(otp));
//   }

//   Widget _buildOtpBox(int index) {
//     return Container(
//       height: 60,
//       width: 60,
//       decoration: BoxDecoration(
//         border: Border.all(color: AppColors.lightGreen),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: TextField(
//         focusNode: _focusNodes[index],
//         controller: _controllers[index],
//         maxLength: 1,
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         decoration: const InputDecoration(counterText: "",border: InputBorder.none),
//         onChanged: (value) {
//           if (value.isNotEmpty) {
//             if (index < _focusNodes.length - 1) {
//               FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
//             } else {
//               FocusScope.of(context).unfocus();
//             }
//           } else if (index > 0) {
//             FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
//           }
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OtpMainBloc, OtpState>(
//       listener: (context, state) {
//         final status = state.otpApiResponse.status;
//         final message = state.otpApiResponse.message ?? '';

//         if (status == Status.failure) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//         } else if (status == Status.success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(message, style: const TextStyle(color: Colors.green))),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(title: const Text("Verify OTP")),
//           body: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Enter the 4-digit OTP sent to your email", style: TextStyle(fontSize: 16)),
//                 const SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(4, (index) => _buildOtpBox(index)),
//                 ),
//                 const SizedBox(height: 32),
//                 state.otpApiResponse.status == Status.loading
//                     ? const CustomLoader()
//                     : ElevatedButton(
//                         onPressed: () => _onOtpSubmit(context),
//                         child: const Text("Verify OTP"),
//                       ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/views/auth/otp/widgets/otp_widget_bloc.dart';

class OtpMainScreen extends StatelessWidget {
  final String email;
  const OtpMainScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    Size siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:AppColors.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: siz.height / 6),
            Container(
              height: (siz.height / 6) * 5,
              width: siz.width,
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text("Enter Your OTP!", style: Theme.of(context).textTheme.headlineSmall),
                  Text("We have sent you an otp to your email", style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 20),
                  Text(email, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 50),
                  OtpScreenBloc(email: email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
