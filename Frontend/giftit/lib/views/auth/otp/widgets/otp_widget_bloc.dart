import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/otp/otp_main_bloc.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/widgets/custom_loader.dart';
import 'package:giftit/views/widgets/redirection_butttons_with_text.dart';

class OtpScreenBloc extends StatefulWidget {
  final String email,type;
  const OtpScreenBloc({super.key, required this.email,required this.type});

  @override
  State<OtpScreenBloc> createState() => _OtpScreenBlocState();
}

class _OtpScreenBlocState extends State<OtpScreenBloc> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onOtpSubmit(BuildContext context) {
    final otp = _controllers.map((c) => c.text.trim()).join();
    if (otp.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter 4-digit OTP")));
      return;
    }
    context.read<OtpMainBloc>().add(OtpSubmitted(otp,widget.email,widget.type));
  }

  Widget _buildOtpBox(int index) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        border: Border.all(color: AppColors.primaryGreen),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        focusNode: _focusNodes[index],
        controller: _controllers[index],
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(counterText: "", border: InputBorder.none),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final siz = MediaQuery.of(context).size;
    return BlocConsumer<OtpMainBloc, OtpState>(
      listener: (context, state) {
        final status = state.otpApiResponse.status;
        final message = state.otpApiResponse.message ?? '';

        if (status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
        } else if (status == Status.success) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text(message, style: const TextStyle(color: Colors.green)),
          // ));

          Future.microtask(() {
            if (!mounted) return;
            if(widget.type == "authVerification") {
              Navigator.pushNamed(
                context,
                RoutesNames.home, // Use your actual named route
                arguments: state.otpApiResponse.data?.token,
                // arguments:widget.email,  
              );
            }
            else if(widget.type == "passwordVerification") {
              Navigator.pushNamed(
                context,
                RoutesNames.resetpswd,
                arguments:widget.email,  
              );
            }
          });
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, _buildOtpBox),
            ),
            const SizedBox(height: 50),
            state.otpApiResponse.status == Status.loading
                ? const CustomLoader()
                // : ElevatedButton(
                //     onPressed: () => _onOtpSubmit(context),
                //     child: const Text("Verify OTP"),
                //   ),
                :RedirectionButttonsWithText(
                  onTap:()=> _onOtpSubmit(context),
                  text: "Verify", 
                  width: (siz.width/3)*2, height: siz.height/15,
                  buttonColor: AppColors.primaryGreen,
                )
          ],
        );
      },
    );
  }
}
