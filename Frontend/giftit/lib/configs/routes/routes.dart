import 'package:flutter/material.dart';
import 'package:giftit/configs/routes/route_names.dart';
import 'package:giftit/views/login/login_main_screen.dart';
import 'package:giftit/views/post_createdialog/post_dialog.dart';
import 'package:giftit/views/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:giftit/views/widgets/dummy_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => BottomNavBar());
      case RoutesNames.dummy:
        return MaterialPageRoute(
            builder: (BuildContext context) => DummyScreen());
      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RoutesNames.postCreateDialog:
        return MaterialPageRoute(
            builder: (BuildContext context) => Postcreationdialog());
      default :
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
