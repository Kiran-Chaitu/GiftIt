import 'package:flutter/material.dart';
import 'package:giftit/configs/colors/app_colors.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/data/Local%20Storage/secure_storage.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryGreen),
          onPressed: ()async {
              await SecureStorage().delete(key: 'token');
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(RoutesNames.login);
          },
          child: const Text("Logout"),
        ),
      ],
    );
  }
}
