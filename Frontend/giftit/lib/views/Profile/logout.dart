import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text('Edit Profile',
              style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white)),
        ),
        leading: const BackButton(color: Colors.white),
      ),
      body: const Center(
        child: Text('Logout Page'),
      ),
    );
  }
}
