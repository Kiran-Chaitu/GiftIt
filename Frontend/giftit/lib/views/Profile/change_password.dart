import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text('Change Password',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white)),
        ),
        leading: const BackButton(color: Colors.white),
      ),
      body: const Center(
        child: Text('Change Password Page'),
      ),
    );
  }
}
