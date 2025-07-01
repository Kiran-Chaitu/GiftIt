import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:giftit/bloc/auth/password_modifications/forgetpassword/email_forgetpassword/email_fp_main_bloc.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/data/API_Response/status.dart';
import 'package:giftit/views/widgets/custom_loader.dart';
import 'package:giftit/views/widgets/redirection_butttons_with_text.dart';
import 'package:giftit/configs/colors/app_colors.dart';

class EmailScreenBlocWidget extends StatefulWidget {
  const EmailScreenBlocWidget({super.key});

  @override
  State<EmailScreenBlocWidget> createState() => _EmailScreenBlocWidgetState();
}

class _EmailScreenBlocWidgetState extends State<EmailScreenBlocWidget> {
  final TextEditingController _emailController = TextEditingController();

  void _onSubmit() {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email")),
      );
      return;
    }
    context.read<EmailFpMainBloc>().add(SubmitEmail(email));
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<EmailFpMainBloc, EmailState>(
      listener: (context, state) {
        final status = state.response.status;
        final message = state.response.message ?? '';

        if (status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
        } 
        else if (status == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          );
          Future.microtask(() {
            Navigator.pushNamed(
              context,
              RoutesNames.otp,
              arguments:{ 'email':_emailController.text,'type':"passwordVerification"} 
            );
          });
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Enter Your Email",
                  // style: Theme.of(context).textTheme.headlineSmall,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
                ),
              ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text("We will send a verification to this email", style: TextStyle(color: Colors.grey)),
                  ),
                  const SizedBox(height: 40),
              Container(
                height: size.height / 12,
                width: (size.width / 3) * 2.5,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  controller: _emailController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              state.response.status == Status.loading
                  ? const CustomLoader()
                  : RedirectionButttonsWithText(
                      text: "Send otp",
                      width: (size.width / 3) * 2,
                      height: size.height / 10,
                      onTap: _onSubmit,
                      buttonColor: AppColors.primaryGreen,
                    ),
            ],
          ),
        );
      },
    );
  }
}
